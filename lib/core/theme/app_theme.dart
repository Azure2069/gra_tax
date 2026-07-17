import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    const green=Color(0xFF0D6B4D);
    final scheme=ColorScheme.fromSeed(seedColor: green);
    return ThemeData(
      useMaterial3:true,
      colorScheme:scheme,
      scaffoldBackgroundColor:const Color(0xFFF5F7F4),
      cardTheme:CardThemeData(elevation:0,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(22),side:const BorderSide(color:Color(0xFFE1E7E1)))),
      inputDecorationTheme:InputDecorationTheme(filled:true,fillColor:Colors.white,border:OutlineInputBorder(borderRadius:BorderRadius.circular(16))),
      elevatedButtonTheme:ElevatedButtonThemeData(style:ElevatedButton.styleFrom(minimumSize:const Size.fromHeight(54),backgroundColor:green,foregroundColor:Colors.white,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)))),
      navigationBarTheme:const NavigationBarThemeData(height:72,indicatorColor:Color(0xFFDDF2E8)),
    );
  }
}
