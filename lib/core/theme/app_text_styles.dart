import 'package:flutter/material.dart';
import '../constants/font_size.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'AlNaseeb';

  static TextTheme get textTheme {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.displayLarge,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.displayMedium,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
        height: 1.2,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.displaySmall,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
        height: 1.2,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.headlineLarge,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.headlineMedium,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.headlineSmall,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.titleLarge,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.titleMedium,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.titleSmall,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.bodyLarge,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurface,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.bodyMedium,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurfaceVariant,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.bodySmall,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurfaceVariant,
        height: 1.5,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.labelLarge,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.labelMedium,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceVariant,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: AppFontSize.labelSmall,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceVariant,
      ),
    );
  }
}
