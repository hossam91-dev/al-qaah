import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class HallAvailabilityCalendar extends StatelessWidget {
  const HallAvailabilityCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final dates = [
      {'day': 'السبت', 'num': '14', 'month': 'أكتوبر', 'selected': true},
      {'day': 'الأحد', 'num': '15', 'month': 'أكتوبر', 'selected': false},
      {'day': 'الاثنين', 'num': '16', 'month': 'أكتوبر', 'selected': false},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.available_dates_label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Text(
              l10n.see_all_dates,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            //reverse: true, // RTL
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSelected = date['selected'] as bool;

              return Container(
                width: 85,
                margin: const EdgeInsetsDirectional.only(end: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date['day'] as String,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isSelected
                            ? Colors.white.withValues(alpha: 0.5)
                            : AppColors.outline,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date['num'] as String,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date['month'] as String,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isSelected
                            ? Colors.white.withValues(alpha: 0.5)
                            : AppColors.outline,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
