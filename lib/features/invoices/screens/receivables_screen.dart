import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/database/app_database.dart';
import '../../../core/providers/core_providers.dart';
import '../../../core/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';

final receivablesProvider = FutureProvider<List<InvoiceReceivableRow>>((
  ref,
) async {
  final db = ref.watch(databaseProvider);
  return db.getReceivables();
});

class ReceivablesScreen extends ConsumerWidget {
  const ReceivablesScreen({super.key});

  Future<void> _sendReminder(
    BuildContext context,
    InvoiceReceivableRow row,
  ) async {
    final phone = row.customerPhone?.replaceAll(RegExp(r'[^0-9+]'), '');
    final message =
        'Hello ${row.customerName}, this is a reminder that invoice ${row.invoiceNumber} still has an outstanding balance of ${formatGhs(row.balanceDue)}. Please settle it at your earliest convenience.';
    final url = Uri.parse(
      'https://wa.me/${phone ?? ''}?text=${Uri.encodeComponent(message)}',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to open WhatsApp reminder.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(receivablesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Receivables')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, _) =>
                Center(child: Text('Unable to load receivables: $error')),
        data: (rows) {
          if (rows.isEmpty) {
            return const Center(child: Text('No outstanding receivables.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: rows.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              final row = rows[index];
              return Card(
                child: ListTile(
                  title: Text('${row.invoiceNumber} · ${row.customerName}'),
                  subtitle: Text(
                    'Issued ${row.dateCreated.toLocal().toString().split(' ').first} · Balance ${formatGhs(row.balanceDue)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.message_outlined),
                    tooltip: 'Send reminder',
                    onPressed: () => _sendReminder(context, row),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
