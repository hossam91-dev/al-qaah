import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isLoading;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.isLoading = false,
    this.icon,
  });

  const AppButton.primary({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : isPrimary = true;

  const AppButton.secondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : isPrimary = false;

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,

          child: _buildContent(),
        ),
      );
    } else {
      return SizedBox(
        height: 48,
        width: double.infinity,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primary, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            foregroundColor: AppColors.primary,
          ),
          child: _buildContent(),
        ),
      );
    }
  }

  Widget _buildContent() {
    if (isLoading) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
