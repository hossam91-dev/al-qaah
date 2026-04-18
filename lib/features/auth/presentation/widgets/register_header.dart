import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.register_title,
          style: AppTextStyles.tajawal(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        Text(
          l10n.register_subtitle,
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
