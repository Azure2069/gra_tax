/// Generates invoice PDFs and exposes print/share actions.
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

class InvoicePdfData {
  const InvoicePdfData({
    required this.businessName,
    required this.businessPhone,
    required this.businessTin,
    required this.customerName,
    required this.customerTin,
    required this.invoiceNumber,
    required this.dateCreated,
    required this.items,
    required this.discountAmount,
    required this.subtotal,
    required this.nhil,
    required this.getfund,
    required this.covidLevy,
    required this.vat,
    required this.grandTotal,
  });

  final String businessName;
  final String businessPhone;
  final String? businessTin;
  final String customerName;
  final String? customerTin;
  final String invoiceNumber;
  final DateTime dateCreated;
  final List<InvoicePdfLine> items;
  final double discountAmount;
  final double subtotal;
  final double nhil;
  final double getfund;
  final double covidLevy;
  final double vat;
  final double grandTotal;
}

class InvoicePdfLine {
  const InvoicePdfLine({
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.lineTotal,
  });

  final String description;
  final int quantity;
  final double unitPrice;
  final double lineTotal;
}

class InvoicePdfService {
  Future<Uint8List> generateInvoicePdf(InvoicePdfData data) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'GRA Compliance App',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8),
              pw.Text(data.businessName),
              pw.Text('Phone: ${data.businessPhone}'),
              if (data.businessTin != null && data.businessTin!.isNotEmpty)
                pw.Text('TIN: ${data.businessTin}'),
              pw.Divider(height: 24),
              pw.Text(
                'Invoice ${data.invoiceNumber}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Date: ${data.dateCreated.toLocal().toIso8601String().split('T').first}',
              ),
              pw.SizedBox(height: 8),
              pw.Text('Customer: ${data.customerName}'),
              if (data.customerTin != null && data.customerTin!.isNotEmpty)
                pw.Text('Customer TIN: ${data.customerTin}'),
              pw.SizedBox(height: 16),
              pw.Table.fromTextArray(
                headers: ['Item', 'Qty', 'Unit', 'Line Total'],
                data:
                    data.items
                        .map(
                          (item) => [
                            item.description,
                            item.quantity.toString(),
                            item.unitPrice.toStringAsFixed(2),
                            item.lineTotal.toStringAsFixed(2),
                          ],
                        )
                        .toList(),
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text(
                        'Subtotal: GHS ${data.subtotal.toStringAsFixed(2)}',
                      ),
                      pw.Text('NHIL: GHS ${data.nhil.toStringAsFixed(2)}'),
                      pw.Text(
                        'GETFund: GHS ${data.getfund.toStringAsFixed(2)}',
                      ),
                      pw.Text(
                        'COVID Levy: GHS ${data.covidLevy.toStringAsFixed(2)}',
                      ),
                      pw.Text('VAT: GHS ${data.vat.toStringAsFixed(2)}'),
                      pw.Text(
                        'Grand Total: GHS ${data.grandTotal.toStringAsFixed(2)}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<void> printInvoice(Uint8List bytes) async {
    await Printing.layoutPdf(onLayout: (_) async => bytes);
  }

  Future<void> shareInvoice(Uint8List bytes, {String? subject}) async {
    await Share.shareXFiles([
      XFile.fromData(bytes, name: 'invoice.pdf', mimeType: 'application/pdf'),
    ], subject: subject ?? 'Invoice');
  }
}
