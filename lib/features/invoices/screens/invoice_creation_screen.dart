// Create invoices offline with draft items and live tax breakdowns.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/database/app_database.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/tax_calculator.dart';
import '../../data/app_repository.dart';
import '../providers/invoice_provider.dart';

class InvoiceCreationScreen extends ConsumerStatefulWidget {
  const InvoiceCreationScreen({super.key});

  @override
  ConsumerState<InvoiceCreationScreen> createState() =>
      _InvoiceCreationScreenState();
}

class _InvoiceCreationScreenState extends ConsumerState<InvoiceCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _invoiceNumber = TextEditingController(text: 'INV-1001');
  final _customerName = TextEditingController();
  final _customerTin = TextEditingController();
  final _productName = TextEditingController();
  final _quantity = TextEditingController(text: '1');
  final _unitPrice = TextEditingController(text: '0');
  final _discount = TextEditingController(text: '0');
  final _amountPaid = TextEditingController(text: '0');
  final _customerId = TextEditingController(text: '1');
  String _paymentStatus = 'unpaid';

  @override
  void dispose() {
    _invoiceNumber.dispose();
    _customerName.dispose();
    _customerTin.dispose();
    _productName.dispose();
    _quantity.dispose();
    _unitPrice.dispose();
    _discount.dispose();
    _amountPaid.dispose();
    _customerId.dispose();
    super.dispose();
  }

  void _clearLineFields() {
    _productName.clear();
    _quantity.text = '1';
    _unitPrice.text = '0';
  }

  void _addCurrentLine() {
    final quantity = int.tryParse(_quantity.text) ?? 1;
    final unitPrice = double.tryParse(_unitPrice.text) ?? 0.0;
    final lineTotal = quantity * unitPrice;
    ref
        .read(invoiceProvider.notifier)
        .addLine(
          InvoiceLineDraft(
            productName:
                _productName.text.trim().isEmpty
                    ? 'Unnamed item'
                    : _productName.text.trim(),
            quantity: quantity,
            unitPrice: unitPrice,
            isTaxable: true,
            lineTotal: lineTotal,
          ),
        );
    ref
        .read(invoiceProvider.notifier)
        .setDiscount(double.tryParse(_discount.text) ?? 0.0);
    _clearLineFields();
  }

  void _addInventoryProduct(Product product) {
    final quantity = int.tryParse(_quantity.text) ?? 1;
    final unitPrice = product.sellingPrice;
    final lineTotal = quantity * unitPrice;
    ref
        .read(invoiceProvider.notifier)
        .addLine(
          InvoiceLineDraft(
            productName: product.name,
            quantity: quantity,
            unitPrice: unitPrice,
            isTaxable: true,
            lineTotal: lineTotal,
          ),
        );
    ref
        .read(invoiceProvider.notifier)
        .setDiscount(double.tryParse(_discount.text) ?? 0.0);
    _clearLineFields();
  }

  @override
  Widget build(BuildContext context) {
    final draft =
        ref.watch(invoiceProvider).valueOrNull ?? const InvoiceDraft();
    final products = ref.watch(productsProvider).valueOrNull ?? [];
    final calculator = TaxCalculator();
    final taxableBase = draft.lines.fold<double>(
      0.0,
      (sum, line) => sum + line.lineTotal,
    );
    final breakdown = calculator.calculate(
      taxableBase: taxableBase,
      isVatRegistered: true,
      vatRate: 15,
      nhilRate: 2.5,
      getfundRate: 2.5,
      covidLevyRate: 1,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Create invoice')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _invoiceNumber,
              decoration: const InputDecoration(labelText: 'Invoice number'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _customerName,
              decoration: const InputDecoration(labelText: 'Customer name'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _customerTin,
              decoration: const InputDecoration(labelText: 'Customer TIN'),
            ),
            const SizedBox(height: 8),
            if (products.isNotEmpty) ...[
              const Text(
                'Tap a product to add it to the invoice',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (_, index) {
                    final product = products[index];
                    return SizedBox(
                      width: 150,
                      child: InkWell(
                        onTap:
                            product.quantity < 1
                                ? null
                                : () => _addInventoryProduct(product),
                        child: Card(
                          color:
                              product.quantity < 1
                                  ? Colors.grey.shade200
                                  : null,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const Spacer(),
                                Text(formatGhs(product.sellingPrice)),
                                Text('${product.quantity} available'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _productName,
              decoration: const InputDecoration(labelText: 'Product name'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _quantity,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Qty'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _unitPrice,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Unit price'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _discount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Discount'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _paymentStatus,
              decoration: const InputDecoration(labelText: 'Payment status'),
              items: const [
                DropdownMenuItem(value: 'unpaid', child: Text('Unpaid')),
                DropdownMenuItem(value: 'partial', child: Text('Partial')),
                DropdownMenuItem(value: 'paid', child: Text('Settled')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _paymentStatus = value);
                }
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _amountPaid,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount paid now'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _addCurrentLine,
              child: const Text('Add line'),
            ),
            const SizedBox(height: 16),
            if (draft.lines.isNotEmpty)
              Card(
                child: Column(
                  children: [
                    for (final (index, line) in draft.lines.indexed)
                      ListTile(
                        title: Text(line.productName),
                        subtitle: Text(
                          '${line.quantity} x GHS ${line.unitPrice.toStringAsFixed(2)}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('GHS ${line.lineTotal.toStringAsFixed(2)}'),
                            IconButton(
                              tooltip: 'Remove ${line.productName}',
                              onPressed:
                                  () => ref
                                      .read(invoiceProvider.notifier)
                                      .removeLine(index),
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tax breakdown',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Subtotal: GHS ${breakdown.subtotal.toStringAsFixed(2)}',
                    ),
                    Text('NHIL: GHS ${breakdown.nhil.toStringAsFixed(2)}'),
                    Text(
                      'GETFund: GHS ${breakdown.getfund.toStringAsFixed(2)}',
                    ),
                    Text(
                      'COVID Levy: GHS ${breakdown.covidLevy.toStringAsFixed(2)}',
                    ),
                    Text('VAT: GHS ${breakdown.vat.toStringAsFixed(2)}'),
                    Text(
                      'Grand total: GHS ${breakdown.grandTotal.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () async {
                final customerId = int.tryParse(_customerId.text) ?? 1;
                final invoiceNumber = _invoiceNumber.text.trim();
                final amountPaid = double.tryParse(_amountPaid.text) ?? 0.0;
                await ref
                    .read(invoiceProvider.notifier)
                    .createInvoice(
                      invoiceNumber: invoiceNumber,
                      customerId: customerId,
                      customerName:
                          _customerName.text.trim().isEmpty
                              ? 'Walk-in customer'
                              : _customerName.text.trim(),
                      customerPhone:
                          _customerName.text.trim().isEmpty ? null : null,
                      customerTin:
                          _customerTin.text.trim().isEmpty
                              ? null
                              : _customerTin.text.trim(),
                      businessName: 'GRA Compliance App',
                      businessPhone: '+233000000000',
                      businessTin: null,
                      status: _paymentStatus,
                      amountPaid: amountPaid,
                    );
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invoice saved locally')),
                );
              },
              child: const Text('Save invoice'),
            ),
          ],
        ),
      ),
    );
  }
}
