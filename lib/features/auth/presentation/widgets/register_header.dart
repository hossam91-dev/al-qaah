import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/responsive_utils/responsive_helper.dart';

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
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
            fontSize: context.sp(6).clamp(24.0, 32.0),
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: context.hp(1)),
        Text(
          l10n.register_subtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.onSurfaceVariant,
            fontSize: context.sp(3.5).clamp(14.0, 18.0),
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
