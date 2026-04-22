import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum SnackBarType { success, error, warning }

class AppSnackBar {
  AppSnackBar._();

  static void show(
    BuildContext context, {
    required String message,
    required SnackBarType type,
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Remove current snackbar if any
    scaffoldMessenger.removeCurrentSnackBar();

    Color backgroundColor;
    IconData icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = const Color(0xFF00A36C); // Jade Green
        icon = Icons.check_circle_outline;
        break;
      case SnackBarType.error:
        backgroundColor = AppColors.error;
        icon = Icons.error_outline;
        break;
      case SnackBarType.warning:
        backgroundColor = const Color(0xFFFFA000); // Amber
        icon = Icons.warning_outlined;
        break;
    }

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.tajawal(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
        elevation: 4,
      ),
    );
  }

  static void success(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.success);
  }

  static void error(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.error);
  }

  static void warning(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.warning);
  }
}
