import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/app_database.dart';
import '../services/app_services.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
final businessPrefsProvider = Provider((ref) => BusinessPrefs());
final pinServiceProvider = Provider((ref) => PinService());
