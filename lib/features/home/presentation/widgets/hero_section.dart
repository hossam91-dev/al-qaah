import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils/responsive_text.dart';
import '../../../../core/utils/responsive_utils/responsive_helper.dart';
import '../../../../l10n/app_localizations.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          l10n.hero_title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            height: 1.2,
          ),
        ),
        SizedBox(height: context.hp(1)),
        ResponsiveText(
          l10n.hero_subtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.outline,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
