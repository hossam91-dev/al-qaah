import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppTextStyles.tajawal(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: AppTextStyles.tajawal(
            fontSize: 16,
            color: AppColors.onSurfaceVariant,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
