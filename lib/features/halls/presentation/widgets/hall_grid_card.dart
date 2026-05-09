import '../../../../core/constants/radius.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';

class HallGridCard extends StatelessWidget {
  final String name;
  final String region;
  final int capacity;
  final double price;
  final double rating;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const HallGridCard({
    super.key,
    required this.name,
    required this.region,
    required this.capacity,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isFavorite = false,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadius.r16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            placeholder: (context, url) => Container(
              height: context.hp(20), // Responsive height for placeholder
              color: AppColors.surfaceContainerHigh,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: context.hp(20),
              color: AppColors.surfaceContainerHigh,
              child: const Icon(Icons.error),
            ),
            imageBuilder: (context, imageProvider) => Stack(
              children: [
                Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                // Favorite Button
                Positioned(
                  top: context.wp(2),
                  left: context.wp(2),
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      padding: EdgeInsets.all(context.wp(1.5)),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest.withValues(
                          alpha: 0.8,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: context.sp(4.5).clamp(16.0, 24.0),
                        color: isFavorite ? AppColors.error : AppColors.outline,
                      ),
                    ),
                  ),
                ),
                // Region Overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.wp(2),
                      vertical: context.hp(1),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: ResponsiveText(
                      region,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Info Section
          Padding(
            padding: EdgeInsets.all(context.wp(2.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: context.hp(0.5)),
                // Capacity
                Row(
                  children: [
                    Icon(
                      Icons.people_outline_rounded,
                      size: context.sp(3.5).clamp(12.0, 16.0),
                      color: AppColors.outline,
                    ),
                    SizedBox(width: context.wp(1)),
                    ResponsiveText(
                      'حتى $capacity شخص',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.outline,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.hp(1)),
                // Price and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResponsiveText(
                      '${price.toStringAsFixed(0)} ج.م',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    Row(
                      children: [
                        ResponsiveText(
                          rating.toString(),
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(
                                  0xFFFFC107,
                                ), // Gold/Amber standard
                              ),
                        ),
                        Icon(
                          Icons.star_rounded,
                          size: context.sp(4).clamp(14.0, 18.0),
                          color: const Color(0xFFFFC107),
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
  }
}
