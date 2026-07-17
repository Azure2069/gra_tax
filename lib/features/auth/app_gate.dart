import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home/home_shell.dart';
import 'auth_provider.dart';
import 'login_screen.dart';
import 'setup_screen.dart';

class AppGate extends ConsumerWidget {const AppGate({super.key});@override Widget build(BuildContext context,WidgetRef ref){switch(ref.watch(authProvider).stage){case AuthStage.loading:return const Scaffold(body:Center(child:CircularProgressIndicator()));case AuthStage.setup:return const SetupScreen();case AuthStage.locked:return const LoginScreen();case AuthStage.authenticated:return const HomeShell();}}}
