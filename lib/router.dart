/// GoRouter configuration for the BizInvoice Ghana shell and invoice flows.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/app_gate.dart';
import 'features/home/home_shell.dart';
import 'features/invoices/screens/invoice_creation_screen.dart';
import 'features/invoices/screens/receivables_screen.dart';
import 'features/invoices/screens/vat_summary_screen.dart';
import 'features/reports/reports_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const AppGate()),
      GoRoute(path: '/home', builder: (context, state) => const HomeShell()),
      GoRoute(
        path: '/invoices/new',
        builder: (context, state) => const InvoiceCreationScreen(),
      ),
      GoRoute(
        path: '/receivables',
        builder: (context, state) => const ReceivablesScreen(),
      ),
      GoRoute(
        path: '/vat-summary',
        builder: (context, state) => const VatSummaryScreen(),
      ),
      GoRoute(
        path: '/reports',
        builder: (context, state) => const ReportsScreen(),
      ),
    ],
  );
});
