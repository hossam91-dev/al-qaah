import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class HallInfoSection extends StatelessWidget {
  final String name;
  final double price;
  final double rating;
  final int reviewsCount;
  final String description;

  const HallInfoSection({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ResponsiveText(
                name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ResponsiveText(
                  l10n.starts_from,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: AppColors.outline),
                ),
                ResponsiveText(
                  '${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} ${l10n.currency_egp}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.star_rounded, size: 20, color: Color(0xFFFFC107)),
            const Icon(Icons.star_rounded, size: 20, color: Color(0xFFFFC107)),
            const Icon(Icons.star_rounded, size: 20, color: Color(0xFFFFC107)),
            const Icon(Icons.star_rounded, size: 20, color: Color(0xFFFFC107)),
            const Icon(Icons.star_rounded, size: 20, color: Color(0xFFFFC107)),
            const SizedBox(width: 8),
            ResponsiveText(
              '$rating • ${l10n.reviews_count_label(reviewsCount)}',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
          ],
        ),
        const SizedBox(height: 32),
        ResponsiveText(
          l10n.about_hall,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 16),
          decoration: const BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
          child: ResponsiveText(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontStyle: FontStyle.italic,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
