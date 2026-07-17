import 'package:flutter/material.dart';

class AppTheme {
  static const primaryOrange = Color(0xFFE85D04);
  static const darkOrange = Color(0xFFB83B00);
  static const complementaryBlue = Color(0xFF2457A6);

  static ThemeData get light {
    final generatedScheme = ColorScheme.fromSeed(
      seedColor: primaryOrange,
      brightness: Brightness.light,
    );
    final scheme = generatedScheme.copyWith(
      primary: primaryOrange,
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFFFFDBC8),
      onPrimaryContainer: const Color(0xFF351000),
      secondary: complementaryBlue,
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFFD9E3FF),
      onSecondaryContainer: const Color(0xFF001A41),
      surface: const Color(0xFFFFFBF8),
      onSurface: const Color(0xFF251A15),
      outlineVariant: const Color(0xFFE8D7CE),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFFFF7F2),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFF7F2),
        foregroundColor: Color(0xFF351000),
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFFFFFBF8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: Color(0xFFE8D7CE)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFFFBF8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryOrange, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryOrange,
        foregroundColor: Colors.white,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        height: 72,
        backgroundColor: Color(0xFFFFFBF8),
        indicatorColor: Color(0xFFFFDBC8),
      ),
    );
  }
}
