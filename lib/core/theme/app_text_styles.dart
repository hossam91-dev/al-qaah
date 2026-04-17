import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: GoogleFonts.notoSerif(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
        height: 1.2,
      ),
      displayMedium: GoogleFonts.notoSerif(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
        height: 1.2,
      ),
      displaySmall: GoogleFonts.notoSerif(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
        height: 1.2,
      ),
      headlineLarge: GoogleFonts.notoSerif(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
      headlineMedium: GoogleFonts.notoSerif(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      headlineSmall: GoogleFonts.notoSerif(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      titleSmall: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurface,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurfaceVariant,
        height: 1.5,
      ),
      bodySmall: GoogleFonts.plusJakartaSans(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurfaceVariant,
        height: 1.5,
      ),
      labelLarge: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
      ),
      labelMedium: GoogleFonts.plusJakartaSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceVariant,
      ),
      labelSmall: GoogleFonts.plusJakartaSans(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceVariant,
      ),
    );
  }

  static TextStyle tajawal({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.onSurface,
    double? height,
  }) {
    return GoogleFonts.tajawal(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height ?? 1.6,
    );
  }
}
