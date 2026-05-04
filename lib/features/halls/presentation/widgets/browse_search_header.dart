import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class BrowseSearchHeader extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final int activeFilterIndex;
  final Function(int) onFilterChanged;

  const BrowseSearchHeader({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.activeFilterIndex,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final filters = [
      {'icon': Icons.location_on_outlined, 'label': l10n.filter_region},
      {'icon': Icons.payments_outlined, 'label': l10n.filter_price},
      {'icon': Icons.people_outline_rounded, 'label': l10n.filter_capacity},
    ];

    return Column(
      children: [
        // Search Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: l10n.search_halls_hint,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.outline),
              prefixIcon: const Icon(Icons.search, color: AppColors.primary),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true, // For RTL
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(filters.length, (index) {
              final isActive = activeFilterIndex == index;
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: InkWell(
                  onTap: () => onFilterChanged(index),
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isActive
                            ? AppColors.primary
                            : AppColors.outlineVariant,
                      ),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          filters[index]['icon'] as IconData,
                          size: 18,
                          color: isActive ? Colors.white : AppColors.primary,
                        ),
                        const SizedBox(width: 8),
                        ResponsiveText(
                          filters[index]['label'] as String,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isActive
                                    ? Colors.white
                                    : AppColors.onSurface,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
