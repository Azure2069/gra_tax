import 'package:bizinvoice_ghana/features/invoices/providers/invoice_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('resolveInvoicePaymentState', () {
    test('marks an invoice as unpaid when nothing is settled', () {
      final state = resolveInvoicePaymentState(
        totalAmount: 100,
        discountAmount: 0,
        amountPaid: 0,
        selectedStatus: 'unpaid',
      );

      expect(state.status, 'unpaid');
      expect(state.balanceDue, 100);
    });

    test('marks an invoice as paid when the user chooses settled', () {
      final state = resolveInvoicePaymentState(
        totalAmount: 100,
        discountAmount: 10,
        amountPaid: 90,
        selectedStatus: 'paid',
      );

      expect(state.status, 'paid');
      expect(state.balanceDue, 0.0);
    });

    test(
      'marks an invoice as partial when payment is smaller than the balance',
      () {
        final state = resolveInvoicePaymentState(
          totalAmount: 100,
          discountAmount: 10,
          amountPaid: 40,
          selectedStatus: 'partial',
        );

        expect(state.status, 'partial');
        expect(state.balanceDue, 50.0);
      },
    );
  });
}
