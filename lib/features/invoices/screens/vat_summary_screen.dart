import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/database/app_database.dart';
import '../../../core/providers/core_providers.dart';
import '../../../core/utils/app_utils.dart';

final vatSummaryProvider = FutureProvider<Map<String, double>>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getTaxSummary();
});

class VatSummaryScreen extends ConsumerWidget {
  const VatSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vatSummaryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('VAT & tax summary')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, _) => Center(child: Text('Unable to load summary: $error')),
        data: (summary) {
          final vat = summary['vat'] ?? 0.0;
          final nhil = summary['nhil'] ?? 0.0;
          final getfund = summary['getfund'] ?? 0.0;
          final covid = summary['covid'] ?? 0.0;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tax summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _row('VAT', vat),
                      _row('NHIL', nhil),
                      _row('GETFund', getfund),
                      _row('COVID levy', covid),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _row(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            formatGhs(value),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
