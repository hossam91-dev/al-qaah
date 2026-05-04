import 'package:al_qaah/core/theme/app_colors.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AiRecommendationCard extends StatelessWidget {
  const AiRecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.wp(6).clamp(16.0, 32.0)),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(context.wp(3).clamp(8.0, 16.0)),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.auto_awesome_rounded,
              color: Colors.white,
              size: context.sp(6).clamp(20.0, 28.0),
            ),
          ),
          SizedBox(height: context.hp(2)),
          ResponsiveText(
            l10n.we_choose_for_you,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: context.hp(1)),
          ResponsiveText(
            l10n.we_choose_desc,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.outline,
              height: 1.5,
            ),
          ),
          SizedBox(height: context.hp(2.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ResponsiveText(
                l10n.start_smart_experience,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: context.wp(2)),
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: context.sp(3.5).clamp(12.0, 16.0),
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
