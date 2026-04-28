import 'package:al_qaah/core/theme/app_colors.dart';
import 'package:al_qaah/core/theme/app_text_styles.dart';
import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FeaturedVenuesHeader extends StatelessWidget {
  const FeaturedVenuesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.featured_halls,
              style: AppTextStyles.tajawal(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.open_in_new_rounded,
              size: 14,
              color: AppColors.outline,
            ),
            const SizedBox(width: 4),
            Text(
              l10n.see_all,
              style: AppTextStyles.tajawal(
                fontSize: 12,
                color: AppColors.outline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
