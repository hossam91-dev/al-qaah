import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileStatsCard extends StatelessWidget {
  final String label;
  final String value;

  const ProfileStatsCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.hp(2)),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ResponsiveText(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: context.hp(0.5)),
          ResponsiveText(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: AppColors.outline),
          ),
        ],
      ),
    );
  }
}
