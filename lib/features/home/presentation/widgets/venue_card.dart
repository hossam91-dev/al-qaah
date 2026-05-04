import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils/responsive_text.dart';
import '../../../../core/utils/responsive_utils/responsive_helper.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/home_cubit.dart';

class VenueCard extends StatelessWidget {
  const VenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => SizedBox(
            height: context.hp(35),
            child: const Center(child: CircularProgressIndicator()),
          ),
          loaded: (featured) {
            if (featured == null) return const SizedBox.shrink();

            final coverImage = featured.images.isNotEmpty
                ? featured.images.first
                : null;

            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                        child: coverImage != null
                            ? CachedNetworkImage(
                                imageUrl: coverImage,
                                height: context.hp(22).clamp(160.0, 220.0),
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: context.hp(22).clamp(160.0, 220.0),
                                  color: AppColors.surfaceContainerHigh,
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: context.hp(22).clamp(160.0, 220.0),
                                  color: AppColors.surfaceContainerHigh,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: AppColors.outline,
                                  ),
                                ),
                              )
                            : Container(
                                height: context.hp(22).clamp(160.0, 220.0),
                                color: AppColors.surfaceContainerHigh,
                                child: const Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 48,
                                    color: AppColors.outline,
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: Color(0xFFFFC107),
                              ),
                              SizedBox(width: context.wp(1)),
                              ResponsiveText(
                                featured.avgRating?.toStringAsFixed(1) ?? '0.0',
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.onSurface,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.wp(5).clamp(16.0, 24.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveText(
                          featured.area ?? '',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: AppColors.outline),
                        ),
                        SizedBox(height: context.hp(0.5)),
                        ResponsiveText(
                          featured.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                        ),
                        SizedBox(height: context.hp(2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ResponsiveText(
                              '${featured.pricePerEvent?.toStringAsFixed(0) ?? '0'} ${l10n.currency_egp}',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                            ),
                            Row(
                              children: [
                                ResponsiveText(
                                  l10n.capacity_person(featured.capacity ?? 0),
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(color: AppColors.outline),
                                ),
                                SizedBox(width: context.wp(1)),
                                Icon(
                                  Icons.people_outline_rounded,
                                  size: context.sp(4.5).clamp(16.0, 20.0),
                                  color: AppColors.outline,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (message) => Center(child: Text(message)),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
