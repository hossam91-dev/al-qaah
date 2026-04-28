import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
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

  // Mock data matching the design
  final List<HallModel> _halls = [
    HallModel(
      name: 'حدائق النيل الساحرة',
      region: 'منطقة الزمالك',
      capacity: 300,
      price: 30000,
      rating: 4.8,
      imageUrl:
          'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?q=80&w=600&auto=format&fit=crop', // Aspect ratio ~1:1
    ),
    HallModel(
      name: 'قاعة فيرمونت',
      region: 'مصر الجديدة',
      capacity: 800,
      price: 75000,
      rating: 5.0,
      imageUrl:
          'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?q=80&w=600&auto=format&fit=crop', // Aspect ratio ~16:9
    ),
    HallModel(
      name: 'ذا لوفينج فيلا',
      region: 'طريق الإسكندرية الصحراوي',
      capacity: 200,
      price: 25000,
      rating: 4.7,
      imageUrl:
          'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=600&auto=format&fit=crop', // Aspect ratio ~4:3
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
            padding: const EdgeInsets.fromLTRB(
              16,
              32,
              16,
              24,
            ), // Added top padding (32)
            child: Row(
              spacing: 12,
              // mainAxisAlignment: MainAxisAlignment.start, // Align everything to the right in RTL
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.welcome_user,
                      style: AppTextStyles.tajawal(
                        fontSize: 12,
                        color: AppColors.outline,
                      ),
                    ),
                    Text(
                      'نور محمد',
                      style: AppTextStyles.tajawal(
                        fontSize: 16,
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.search_results,
                  style: AppTextStyles.tajawal(
                    fontSize: 12,
                    color: AppColors.outline,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.halls_elite,
                      style: AppTextStyles.tajawal(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                    ),
                    Text(
                      l10n.halls_available(_halls.length),
                      style: AppTextStyles.tajawal(
                        fontSize: 12,
                        color: AppColors.outline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Staggered Grid
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
          sliver: SliverMasonryGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            itemBuilder: (context, index) {
              final hall = _halls[index];
              return HallGridCard(
                name: hall.name,
                region: hall.region,
                capacity: hall.capacity,
                price: hall.price,
                rating: hall.rating,
                imageUrl: hall.imageUrl,
                isFavorite: hall.isFavorite,
                onFavoriteToggle: () =>
                    setState(() => hall.isFavorite = !hall.isFavorite),
              );
            },
            childCount: _halls.length,
          ),
        ),
      ],
    );
  }
}

class HallModel {
  final String name;
  final String region;
  final int capacity;
  final double price;
  final double rating;
  final String imageUrl;
  bool isFavorite;

  HallModel({
    required this.name,
    required this.region,
    required this.capacity,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
