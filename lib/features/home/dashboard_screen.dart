import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/app_utils.dart';
import '../auth/auth_provider.dart';
import '../data/app_repository.dart';
import '../invoices/screens/invoice_creation_screen.dart';
import '../invoices/screens/receivables_screen.dart';
import '../invoices/screens/vat_summary_screen.dart';
import '../more/customers_screen.dart';
import '../more/expenses_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  bool same(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(authProvider).profile;
    final sales = ref.watch(salesProvider).valueOrNull ?? [];
    final products = ref.watch(productsProvider).valueOrNull ?? [];
    final debts = ref.watch(debtsProvider).valueOrNull ?? [];
    final now = DateTime.now();
    final today = sales.where((x) => same(x.createdAt, now));
    final revenue = today.fold<double>(0, (s, x) => s + x.totalAmount);
    final low = products.where((x) => x.quantity <= x.lowStockThreshold).length;
    final outstanding = debts.fold<double>(0, (s, x) => s + x.balance);

    Widget action(String t, String s, IconData i, Widget page) => Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(i, size: 30),
              const Spacer(),
              Text(t, style: const TextStyle(fontWeight: FontWeight.w900)),
              Text(s, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(p?.business ?? 'GRA Compliance App'),
            Text(
              '${p?.location ?? ''} · Offline ready',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => ref.read(authProvider.notifier).logout(),
            icon: const Icon(Icons.lock_outline),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D6B4D), Color(0xFF084C38)],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "TODAY'S SALES",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formatGhs(revenue),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '${today.length} transactions',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Low stock $low',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Customer debt ${formatGhs(outstanding)}',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              action(
                'Create invoice',
                'Add products and complete sale',
                Icons.receipt_long_outlined,
                const InvoiceCreationScreen(),
              ),
              action(
                'Receivables',
                'Outstanding balances',
                Icons.account_balance_wallet_outlined,
                const ReceivablesScreen(),
              ),
              action(
                'VAT summary',
                'Taxes and levies',
                Icons.bar_chart_outlined,
                const VatSummaryScreen(),
              ),
              action(
                'Expenses',
                'Business spending',
                Icons.receipt_long_outlined,
                const ExpensesScreen(),
              ),
              action(
                'Customers',
                'Contacts and buyers',
                Icons.people_outline,
                const CustomersScreen(),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.cloud_off_outlined, size: 30),
                      const Spacer(),
                      const Text(
                        'Offline sync',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      const Text('No external APIs needed'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
