import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class BookingHallDetailsCard extends StatelessWidget {
  const BookingHallDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.wp(4)),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadius.r24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.r16),
            child: CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?q=80&w=2098&auto=format&fit=crop',
              height: context.hp(22).clamp(160.0, 220.0),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: context.hp(2)),
          ResponsiveText(
            'قاعة الثريا الكبرى',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: context.hp(0.5)),
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: context.sp(4).clamp(14.0, 18.0),
                color: AppColors.primary,
              ),
              SizedBox(width: context.wp(1)),
              ResponsiveText(
                'التجمع الخامس، القاهرة',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.outline),
              ),
            ],
          ),
          SizedBox(height: context.hp(2)),
          Row(
            children: [
              _buildInfoChip(
                context,
                Icons.calendar_month_outlined,
                '15 أكتوبر 2024',
              ),
              SizedBox(width: context.wp(3)),
              _buildInfoChip(
                context,
                Icons.people_outline_rounded,
                AppLocalizations.of(context)!.guests_count('400 - 500'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(3),
        vertical: context.hp(1),
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: context.sp(4).clamp(14.0, 18.0),
            color: AppColors.outline,
          ),
          SizedBox(width: context.wp(2)),
          ResponsiveText(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
