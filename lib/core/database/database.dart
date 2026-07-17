/// Drift-backed offline database for BizInvoice Ghana.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class BusinessProfiles extends Table {
  @override
  String get tableName => 'business_profile';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get businessName => text().named('business_name')();
  TextColumn get phone => text()();
  TextColumn get email => text()();
  TextColumn get physicalAddress => text().named('physical_address')();
  TextColumn get tin => text().nullable()();
  BoolColumn get isVatRegistered => boolean().named('is_vat_registered')();
  RealColumn get vatRate =>
      real().named('vat_rate').withDefault(const Constant(15.0))();
  RealColumn get nhilRate =>
      real().named('nhil_rate').withDefault(const Constant(2.5))();
  RealColumn get getfundRate =>
      real().named('getfund_rate').withDefault(const Constant(2.5))();
  RealColumn get covidLevyRate =>
      real().named('covid_levy_rate').withDefault(const Constant(1.0))();
  TextColumn get pinHash => text().nullable().named('pin_hash')();
}

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get address => text().nullable()();
  TextColumn get tin => text().nullable()();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get price => real()();
  BoolColumn get isTaxable => boolean().withDefault(const Constant(true))();
}

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceNumber => text().named('invoice_number').unique()();
  IntColumn get customerId => integer().named('customer_id')();
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
    BusinessProfiles,
    Customers,
    Products,
    Invoices,
    InvoiceItems,
    Payments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<BusinessProfile?> getBusinessProfile() =>
      select(businessProfiles).getSingleOrNull();

  Future<void> saveBusinessProfile(BusinessProfilesCompanion companion) async {
    await into(businessProfiles).insertOnConflictUpdate(companion);
  }

  Future<int> createCustomer(
    String name,
    String phone,
    String? address,
    String? tin,
  ) async {
    return into(customers).insert(
      CustomersCompanion.insert(
        name: name,
        phone: phone,
        address: Value(address),
        tin: Value(tin),
      ),
    );
  }

  Future<int> createInvoice({
    required String invoiceNumber,
    required int customerId,
    required double discountAmount,
    required double totalAmount,
    required double balanceDue,
    required String status,
  }) async {
    return into(invoices).insert(
      InvoicesCompanion.insert(
        invoiceNumber: invoiceNumber,
        customerId: customerId,
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
    await into(payments).insert(
      PaymentsCompanion.insert(
        invoiceId: invoiceId,
        amountPaid: amount,
        paymentDate: DateTime.now(),
        paymentMethod: method,
      ),
    );
  }

  Future<void> updateInvoiceStatus(int invoiceId, String status) async {
    await (update(invoices)..where(
      (tbl) => tbl.id.equals(invoiceId),
    )).write(InvoicesCompanion(status: Value(status)));
  }

  Future<double> getSalesSummary({DateTime? from, DateTime? to}) async {
    final query = select(invoices);
    if (from != null) {
      query.where((tbl) => tbl.dateCreated.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where((tbl) => tbl.dateCreated.isSmallerOrEqualValue(to));
    }
    final rows = await query.get();
    return rows.fold<double>(0.0, (sum, row) => sum + (row.totalAmount));
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
    final total = rows.fold<double>(0.0, (sum, row) => sum + (row.totalAmount));
    return {
      'vat': total * 0.15,
      'nhil': total * 0.025,
      'getfund': total * 0.025,
      'covid': total * 0.01,
    };
  }

  Future<List<InvoiceSummaryRow>> getReceivables() async {
    final rows =
        await (select(invoices)..where(
          (tbl) => tbl.status.isIn(['unpaid', 'partial', 'overdue']),
        )).get();
    return rows
        .map(
          (row) => InvoiceSummaryRow(
            row.id,
            row.invoiceNumber,
            row.balanceDue,
            row.status,
          ),
        )
        .toList();
  }
}

class InvoiceSummaryRow {
  const InvoiceSummaryRow(
    this.id,
    this.invoiceNumber,
    this.balanceDue,
    this.status,
  );

  final int id;
  final String invoiceNumber;
  final double balanceDue;
  final String status;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'bizinvoice_ghana.sqlite'));
    return NativeDatabase(file);
  });
}
