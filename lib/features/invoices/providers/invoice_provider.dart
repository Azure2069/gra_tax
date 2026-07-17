/// Riverpod state for building invoice drafts and persisting them offline.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/core_providers.dart';

class InvoiceLineDraft {
  const InvoiceLineDraft({
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.isTaxable,
    required this.lineTotal,
  });

  final String productName;
  final int quantity;
  final double unitPrice;
  final bool isTaxable;
  final double lineTotal;
}

class InvoiceDraft {
  const InvoiceDraft({
    this.lines = const [],
    this.discountAmount = 0.0,
    this.status = 'unpaid',
  });

  final List<InvoiceLineDraft> lines;
  final double discountAmount;
  final String status;

  InvoiceDraft copyWith({
    List<InvoiceLineDraft>? lines,
    double? discountAmount,
    String? status,
  }) {
    return InvoiceDraft(
      lines: lines ?? this.lines,
      discountAmount: discountAmount ?? this.discountAmount,
      status: status ?? this.status,
    );
  }
}

class InvoiceNotifier extends AsyncNotifier<InvoiceDraft> {
  @override
  Future<InvoiceDraft> build() async {
    return const InvoiceDraft();
  }

  void setDiscount(double amount) {
    state = AsyncValue.data(
      state.valueOrNull?.copyWith(discountAmount: amount) ??
          const InvoiceDraft(discountAmount: 0),
    );
  }

  void addLine(InvoiceLineDraft line) {
    final existing = state.valueOrNull ?? const InvoiceDraft();
    state = AsyncValue.data(
      existing.copyWith(lines: [...existing.lines, line]),
    );
  }

  Future<void> createInvoice({
    required String invoiceNumber,
    required int customerId,
    required String customerName,
    String? customerPhone,
    String? customerTin,
    String? businessName,
    String? businessPhone,
    String? businessTin,
  }) async {
    state = const AsyncValue.loading();
    try {
      final db = ref.read(databaseProvider);
      final totalAmount =
          state.valueOrNull?.lines.fold<double>(
            0.0,
            (sum, line) => sum + line.lineTotal,
          ) ??
          0.0;
      final discount = state.valueOrNull?.discountAmount ?? 0.0;
      final balanceDue = totalAmount - discount;
      final invoiceId = await db.createInvoice(
        invoiceNumber: invoiceNumber,
        customerId: customerId,
        customerName: customerName,
        customerPhone: customerPhone,
        customerTin: customerTin,
        businessName: businessName,
        businessPhone: businessPhone,
        businessTin: businessTin,
        discountAmount: discount,
        totalAmount: totalAmount,
        balanceDue: balanceDue,
        status: 'unpaid',
      );

      for (final line
          in state.valueOrNull?.lines ?? const <InvoiceLineDraft>[]) {
        await db.addInvoiceItem(
          invoiceId: invoiceId,
          productName: line.productName,
          quantity: line.quantity,
          unitPrice: line.unitPrice,
          isTaxable: line.isTaxable,
          lineTotal: line.lineTotal,
        );
      }

      state = AsyncValue.data(
        InvoiceDraft(
          lines: state.valueOrNull?.lines ?? const [],
          discountAmount: discount,
          status: 'unpaid',
        ),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> recordPayment({
    required int invoiceId,
    required double amount,
    required String method,
  }) async {
    final db = ref.read(databaseProvider);
    await db.recordPayment(
      invoiceId: invoiceId,
      amount: amount,
      method: method,
    );
    final current = state.valueOrNull ?? const InvoiceDraft();
    state = AsyncValue.data(current.copyWith(status: 'partial'));
  }

  Future<void> updateStatus({
    required int invoiceId,
    required String status,
  }) async {
    final db = ref.read(databaseProvider);
    await db.updateInvoiceStatus(invoiceId, status);
    final current = state.valueOrNull ?? const InvoiceDraft();
    state = AsyncValue.data(current.copyWith(status: status));
  }
}

final invoiceProvider = AsyncNotifierProvider<InvoiceNotifier, InvoiceDraft>(
  InvoiceNotifier.new,
);
