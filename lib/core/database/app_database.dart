import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables.dart';
part 'app_database.g.dart';

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceNumber => text().named('invoice_number').unique()();
  IntColumn get customerId => integer().named('customer_id')();
  TextColumn get customerName => text().named('customer_name').nullable()();
  TextColumn get customerPhone => text().named('customer_phone').nullable()();
  TextColumn get customerTin => text().named('customer_tin').nullable()();
  TextColumn get businessName => text().named('business_name').nullable()();
  TextColumn get businessPhone => text().named('business_phone').nullable()();
  TextColumn get businessTin => text().named('business_tin').nullable()();
  DateTimeColumn get dateCreated => dateTime().named('date_created')();
  RealColumn get discountAmount =>
      real().named('discount_amount').withDefault(const Constant(0.0))();
  RealColumn get totalAmount => real().named('total_amount')();
  RealColumn get balanceDue => real().named('balance_due')();
  TextColumn get status => text().withDefault(const Constant('unpaid'))();
}

class InvoiceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer().named('invoice_id')();
  TextColumn get productName => text().named('product_name')();
  IntColumn get quantity => integer()();
  RealColumn get unitPrice => real().named('unit_price')();
  BoolColumn get isTaxable => boolean()();
  RealColumn get lineTotal => real().named('line_total')();
}

class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer().named('invoice_id')();
  RealColumn get amountPaid => real().named('amount_paid')();
  DateTimeColumn get paymentDate => dateTime().named('payment_date')();
  TextColumn get paymentMethod => text().named('payment_method')();
}

@DriftDatabase(
  tables: [
    Products,
    Customers,
    Sales,
    SaleItems,
    Debts,
    DebtPayments,
    Expenses,
    Invoices,
    InvoiceItems,
    Payments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'trader_flow'));
  @override
  int get schemaVersion => 1;

  Future<int> createInvoice({
    required String invoiceNumber,
    required int customerId,
    required String customerName,
    String? customerPhone,
    String? customerTin,
    String? businessName,
    String? businessPhone,
    String? businessTin,
    required double discountAmount,
    required double totalAmount,
    required double balanceDue,
    required String status,
  }) async {
    return into(invoices).insert(
      InvoicesCompanion.insert(
        invoiceNumber: invoiceNumber,
        customerId: customerId,
        customerName: Value(customerName),
        customerPhone: Value(customerPhone),
        customerTin: Value(customerTin),
        businessName: Value(businessName),
        businessPhone: Value(businessPhone),
        businessTin: Value(businessTin),
        dateCreated: DateTime.now(),
        discountAmount: Value(discountAmount),
        totalAmount: totalAmount,
        balanceDue: balanceDue,
        status: Value(status),
      ),
    );
  }

  Future<void> addInvoiceItem({
    required int invoiceId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required bool isTaxable,
    required double lineTotal,
  }) async {
    await into(invoiceItems).insert(
      InvoiceItemsCompanion.insert(
        invoiceId: invoiceId,
        productName: productName,
        quantity: quantity,
        unitPrice: unitPrice,
        isTaxable: isTaxable,
        lineTotal: lineTotal,
      ),
    );
  }

  Future<void> recordPayment({
    required int invoiceId,
    required double amount,
    required String method,
  }) async {
    final existing =
        await (select(invoices)
          ..where((tbl) => tbl.id.equals(invoiceId))).getSingle();
    final nextBalance = existing.balanceDue - amount;
    final nextState = nextBalance <= 0 ? 'paid' : 'partial';
    await into(payments).insert(
      PaymentsCompanion.insert(
        invoiceId: invoiceId,
        amountPaid: amount,
        paymentDate: DateTime.now(),
        paymentMethod: method,
      ),
    );
    await (update(invoices)..where((tbl) => tbl.id.equals(invoiceId))).write(
      InvoicesCompanion(
        balanceDue: Value(nextBalance < 0 ? 0.0 : nextBalance),
        status: Value(nextState),
      ),
    );
  }

  Future<void> updateInvoiceStatus(int invoiceId, String status) async {
    await (update(invoices)..where(
      (tbl) => tbl.id.equals(invoiceId),
    )).write(InvoicesCompanion(status: Value(status)));
  }

  Future<void> updateInvoiceBalance(int invoiceId, double balanceDue) async {
    await (update(invoices)..where(
      (tbl) => tbl.id.equals(invoiceId),
    )).write(InvoicesCompanion(balanceDue: Value(balanceDue)));
  }

  Future<List<InvoiceReceivableRow>> getReceivables() async {
    final rows =
        await (select(invoices)..where(
          (tbl) => tbl.status.isIn(['unpaid', 'partial', 'overdue']),
        )).get();
    return rows
        .map(
          (row) => InvoiceReceivableRow(
            id: row.id,
            invoiceNumber: row.invoiceNumber,
            customerName: row.customerName ?? 'Walk-in customer',
            customerPhone: row.customerPhone,
            dateCreated: row.dateCreated,
            balanceDue: row.balanceDue,
            status: row.status,
          ),
        )
        .toList();
  }

  Future<Map<String, double>> getTaxSummary({
    DateTime? from,
    DateTime? to,
  }) async {
    final query = select(invoices);
    if (from != null) {
      query.where((tbl) => tbl.dateCreated.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where((tbl) => tbl.dateCreated.isSmallerOrEqualValue(to));
    }
    final rows = await query.get();
    final total = rows.fold<double>(0.0, (sum, row) => sum + row.totalAmount);
    return {
      'vat': total * 0.15,
      'nhil': total * 0.025,
      'getfund': total * 0.025,
      'covid': total * 0.01,
    };
  }
}

class InvoiceReceivableRow {
  const InvoiceReceivableRow({
    required this.id,
    required this.invoiceNumber,
    required this.customerName,
    required this.customerPhone,
    required this.dateCreated,
    required this.balanceDue,
    required this.status,
  });

  final int id;
  final String invoiceNumber;
  final String customerName;
  final String? customerPhone;
  final DateTime dateCreated;
  final double balanceDue;
  final String status;
}
