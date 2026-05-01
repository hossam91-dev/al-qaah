import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
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
          loading: () => const SizedBox(
            height: 280,
            child: Center(child: CircularProgressIndicator()),
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
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: 200,
                                  color: AppColors.surfaceContainerHigh,
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 200,
                                  color: AppColors.surfaceContainerHigh,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: AppColors.outline,
                                  ),
                                ),
                              )
                            : Container(
                                height: 200,
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
                              const SizedBox(width: 4),
                              Text(
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          featured.area ?? '',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: AppColors.outline),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          featured.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  l10n.capacity_person(featured.capacity ?? 0),
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(color: AppColors.outline),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.people_outline_rounded,
                                  size: 16,
                                  color: AppColors.outline,
                                ),
                              ],
                            ),
                            Text(
                              '${featured.pricePerEvent?.toStringAsFixed(0) ?? '0'} ${l10n.currency_egp}',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
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
