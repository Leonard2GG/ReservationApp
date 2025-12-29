import 'package:flutter/material.dart';

class AppTheme {
  // Colores base para Cuba (ahorro de batería en pantallas OLED)
  static const Color background = Color(0xFF0D0D0D);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color accentGradientStart = Color(0xFFC9A66B); // Dorado elegante
  static const Color accentGradientEnd = Color(0xFF8B6E32);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: background,
    cardColor: surface,
    primaryColor: accentGradientStart,
    colorScheme: const ColorScheme.dark(
      primary: accentGradientStart,
      secondary: accentGradientEnd,
      surface: surface,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white70),
    ),
  );

  // Decoración de degradado reutilizable
  static BoxDecoration darkGradient = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [accentGradientStart, accentGradientEnd],
    ),
  );
}