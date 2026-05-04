import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_grid.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class HallFeaturesGrid extends StatelessWidget {
  final int capacity;
  final Map<String, dynamic> amenities;

  const HallFeaturesGrid({
    super.key,
    required this.capacity,
    required this.amenities,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Capacity Big Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveText(
                l10n.hall_capacity_label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ResponsiveText(
                    'فرد',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ResponsiveText(
                    capacity.toString(),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        ResponsiveText(
          l10n.hall_amenities,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 20),
        ResponsiveGrid(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.5,
          itemCount: 4,
          itemBuilder: (context, index) {
            final features = [
              {'icon': Icons.restaurant_rounded, 'label': 'بوفيه فاخر'},
              {'icon': Icons.local_parking_rounded, 'label': 'مواقف سيارات'},
              {'icon': Icons.music_note_rounded, 'label': 'نظام صوتي'},
              {'icon': Icons.ac_unit_rounded, 'label': 'تكييف مركزي'},
            ];
            return _buildFeatureCard(
              context,
              features[index]['icon'] as IconData,
              features[index]['label'] as String,
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeatureCard(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.surfaceContainerLow),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColors.primary),
          const SizedBox(height: 8),
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
