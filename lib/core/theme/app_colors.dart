import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF250548);
  static const Color primaryContainer = Color(0xFF3B1F5E);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFFD2C4FD);

  static const Color secondary = Color(0xFF635789);
  static const Color secondaryContainer = Color(0xFFE8DEFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF1E1341);

  static const Color background = Color(0xFFFAF8FE);
  static const Color surface = Color(0xFFFAF8FE);
  static const Color surfaceContainerLow = Color(0xFFF5F3F9);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerHigh = Color(0xFFE9E7ED);
  static const Color surfaceContainerHighest = Color(0xFFE3E2E7);
  
  static const Color onSurface = Color(0xFF1B1B20);
  static const Color onSurfaceVariant = Color(0xFF4A454F);
  static const Color outline = Color(0xFF7B7580);
  static const Color outlineVariant = Color(0xFFCCC4D0);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    surface: surface,
    onSurface: onSurface,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    outline: outline,
    outlineVariant: outlineVariant,
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryContainer],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
