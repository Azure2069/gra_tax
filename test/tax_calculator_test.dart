import 'package:bizinvoice_ghana/core/utils/tax_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaxCalculator', () {
    test('calculates levies and VAT for a taxable base', () {
      final breakdown = TaxCalculator().calculate(
        taxableBase: 100,
        isVatRegistered: true,
        vatRate: 15,
        nhilRate: 2.5,
        getfundRate: 2.5,
        covidLevyRate: 1,
      );

      expect(breakdown.nhil, 2.5);
      expect(breakdown.getfund, 2.5);
      expect(breakdown.covidLevy, 1.0);
      expect(breakdown.vat, 15.9);
      expect(breakdown.grandTotal, 121.9);
    });
  });
}
