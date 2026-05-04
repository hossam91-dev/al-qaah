import 'package:al_qaah/core/router/app_routes.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_grid.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/features/home/domain/entities/hall_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/browse_search_header.dart';
import '../widgets/hall_grid_card.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  int _activeFilter = 0;

  // Mock data matching the design using HallEntity
  final List<HallEntity> _halls = [
    const HallEntity(
      id: '1',
      name: 'حدائق النيل الساحرة',
      region: 'منطقة الزمالك',
      area: 'الزمالك',
      capacity: 300,
      pricePerEvent: 30000,
      avgRating: 4.8,
      images: [
        'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?q=80&w=600&auto=format&fit=crop',
      ],
      description:
          'قاعة ملكية فاخرة تقع في قلب الزمالك، تتميز بإطلالة مباشرة على النيل وتصاميم هندسية فريدة تجمع بين العراقة والحداثة.',
      amenities: {'ac': true, 'wifi': true, 'parking': true, 'stage': true},
    ),
    const HallEntity(
      id: '2',
      name: 'قاعة فيرمونت',
      region: 'مصر الجديدة',
      area: 'مصر الجديدة',
      capacity: 800,
      pricePerEvent: 75000,
      avgRating: 5.0,
      images: [
        'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?q=80&w=600&auto=format&fit=crop',
      ],
      description:
          'واحدة من أفخم قاعات القاهرة الكبرى، تقدم تجربة فندقية متكاملة مع بوفيه عالمي وأنظمة إضاءة وصوت متطورة جداً.',
      amenities: {'ac': true, 'wifi': true, 'parking': true, 'stage': true},
    ),
    const HallEntity(
      id: '3',
      name: 'ذا لوفينج فيلا',
      region: 'طريق الإسكندرية الصحراوي',
      area: 'طريق الإسكندرية',
      capacity: 200,
      pricePerEvent: 25000,
      avgRating: 4.7,
      images: [
        'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=600&auto=format&fit=crop',
      ],
      description:
          'فيلا خاصة مجهزة للحفلات الخارجية (Open Air) في أجواء هادئة وراقية بعيداً عن صخب المدينة، مثالية للمناسبات الخاصة والعائلية.',
      amenities: {'ac': false, 'wifi': true, 'parking': true, 'stage': true},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomScrollView(
      slivers: [
        // Top User Header
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              context.wp(4),
              context.hp(4),
              context.wp(4),
              context.hp(3),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: context.sp(6).clamp(20.0, 28.0),
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                  ),
                ),
                SizedBox(width: context.wp(3)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveText(
                      l10n.welcome_user,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.outline,
                      ),
                    ),
                    ResponsiveText(
                      'نور محمد',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Search and Filters
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
            child: BrowseSearchHeader(
              controller: _searchCtrl,
              onChanged: (val) => setState(() {}),
              activeFilterIndex: _activeFilter,
              onFilterChanged: (index) => setState(() => _activeFilter = index),
            ),
          ),
        ),

        // Results Summary
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              context.wp(4),
              context.hp(4),
              context.wp(4),
              context.hp(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  l10n.search_results,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: AppColors.outline),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResponsiveText(
                      l10n.halls_elite,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                    ),
                    ResponsiveText(
                      l10n.halls_available(_halls.length),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.outline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Responsive Grid
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            context.wp(4),
            0,
            context.wp(4),
            context.hp(12),
          ),
          sliver: ResponsiveGrid.sliver(
            maxCrossAxisExtent: context.isMobile ? 200 : 300,
            mainAxisSpacing: context.wp(4),
            crossAxisSpacing: context.wp(4),
            childAspectRatio: 0.75,
            itemCount: _halls.length,
            itemBuilder: (context, index) {
              final hall = _halls[index];
              return InkWell(
                onTap: () => context.push(AppRoutes.hallDetails, extra: hall),
                borderRadius: BorderRadius.circular(16),
                child: HallGridCard(
                  name: hall.name,
                  region: hall.region ?? '',
                  capacity: hall.capacity ?? 0,
                  price: hall.pricePerEvent ?? 0,
                  rating: hall.avgRating ?? 0,
                  imageUrl: hall.images.first,
                  isFavorite: false,
                  onFavoriteToggle: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
