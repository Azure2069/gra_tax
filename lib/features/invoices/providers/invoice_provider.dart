// Riverpod state for building invoice drafts and persisting them offline.
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

class InvoicePaymentResolution {
  const InvoicePaymentResolution({
    required this.status,
    required this.balanceDue,
  });

  final String status;
  final double balanceDue;
}

InvoicePaymentResolution resolveInvoicePaymentState({
  required double totalAmount,
  required double discountAmount,
  required double amountPaid,
  required String selectedStatus,
}) {
  final baseAmount = totalAmount - discountAmount;
  final safeBaseAmount = baseAmount < 0 ? 0.0 : baseAmount;
  final safeAmountPaid = amountPaid < 0 ? 0.0 : amountPaid;

  if (selectedStatus == 'paid' || safeAmountPaid >= safeBaseAmount) {
    return const InvoicePaymentResolution(status: 'paid', balanceDue: 0.0);
  }

  if (selectedStatus == 'partial' || safeAmountPaid > 0) {
    final remaining = safeBaseAmount - safeAmountPaid;
    return InvoicePaymentResolution(
      status: remaining <= 0 ? 'paid' : 'partial',
      balanceDue: remaining < 0 ? 0.0 : remaining,
    );
  }

  if (selectedStatus == 'overdue') {
    return InvoicePaymentResolution(
      status: 'overdue',
      balanceDue: safeBaseAmount,
    );
  }

  return InvoicePaymentResolution(
    status: selectedStatus,
    balanceDue: safeBaseAmount,
  );
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

  void removeLine(int index) {
    final existing = state.valueOrNull ?? const InvoiceDraft();
    if (index < 0 || index >= existing.lines.length) return;

    final lines = [...existing.lines]..removeAt(index);
    state = AsyncValue.data(existing.copyWith(lines: lines));
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
    required String status,
    double amountPaid = 0.0,
  }) async {
    final draft = state.valueOrNull ?? const InvoiceDraft();
    state = const AsyncValue.loading();
    try {
      final db = ref.read(databaseProvider);
      final totalAmount = draft.lines.fold<double>(
        0.0,
        (sum, line) => sum + line.lineTotal,
      );
      final discount = draft.discountAmount;
      final paymentState = resolveInvoicePaymentState(
        totalAmount: totalAmount,
        discountAmount: discount,
        amountPaid: amountPaid,
        selectedStatus: status,
      );
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
        balanceDue: paymentState.balanceDue,
        status: paymentState.status,
      );

      for (final line in draft.lines) {
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
          lines: draft.lines,
          discountAmount: discount,
          status: paymentState.status,
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
