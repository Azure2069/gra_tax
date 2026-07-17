/// Calculates GRA-style tax components for invoice totals.
class TaxBreakdown {
  const TaxBreakdown({
    required this.taxableBase,
    required this.nhil,
    required this.getfund,
    required this.covidLevy,
    required this.vat,
    required this.grandTotal,
    required this.subtotal,
    required this.isVatRegistered,
  });

  final double taxableBase;
  final double nhil;
  final double getfund;
  final double covidLevy;
  final double vat;
  final double grandTotal;
  final double subtotal;
  final bool isVatRegistered;

  static double _round(double value) => double.parse(value.toStringAsFixed(2));
}

class TaxCalculator {
  TaxBreakdown calculate({
    required double taxableBase,
    required bool isVatRegistered,
    required double vatRate,
    required double nhilRate,
    required double getfundRate,
    required double covidLevyRate,
  }) {
    final roundedBase = TaxBreakdown._round(taxableBase);
    final nhil = TaxBreakdown._round(roundedBase * (nhilRate / 100));
    final getfund = TaxBreakdown._round(roundedBase * (getfundRate / 100));
    final covidLevy = TaxBreakdown._round(roundedBase * (covidLevyRate / 100));
    final subtotal = TaxBreakdown._round(
      roundedBase + nhil + getfund + covidLevy,
    );
    final vat =
        isVatRegistered ? TaxBreakdown._round(subtotal * (vatRate / 100)) : 0.0;
    final grandTotal = TaxBreakdown._round(subtotal + vat);

    return TaxBreakdown(
      taxableBase: roundedBase,
      nhil: nhil,
      getfund: getfund,
      covidLevy: covidLevy,
      vat: vat,
      grandTotal: grandTotal,
      subtotal: subtotal,
      isVatRegistered: isVatRegistered,
    );
  }
}
