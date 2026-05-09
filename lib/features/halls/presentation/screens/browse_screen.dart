import 'package:al_qaah/core/router/app_routes.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_grid.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/core/widgets/base_app_bar.dart';
import 'package:al_qaah/features/halls/presentation/bloc/halls_cubit.dart';
import 'package:al_qaah/features/halls/presentation/bloc/halls_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/padding.dart';
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
  final ValueNotifier<int> _activeFilter = ValueNotifier(0);

  @override
  void dispose() {
    _searchCtrl.dispose();
    _activeFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return RefreshIndicator(
      onRefresh: () async {
        final regions = ['all', 'cairo', 'giza', 'alex'];
        context.read<HallsCubit>().getAllHalls(
          searchQuery: _searchCtrl.text,
          region: _activeFilter.value == 0 ? null : regions[_activeFilter.value],
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(AppPadding.baseHori),
          vertical: context.hp(AppPadding.baseVert),
        ),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: context.hp(3),
                ),
                child: const BaseAppBar(),
              ),
            ),

            // Search and Filters
            SliverToBoxAdapter(
              child: ValueListenableBuilder<int>(
                valueListenable: _activeFilter,
                builder: (context, filterIndex, _) {
                  return BrowseSearchHeader(
                    controller: _searchCtrl,
                    onChanged: (val) {
                      final regions = ['all', 'cairo', 'giza', 'alex'];
                      context.read<HallsCubit>().getAllHalls(
                        searchQuery: val,
                        region: filterIndex == 0 ? null : regions[filterIndex],
                      );
                    },
                    activeFilterIndex: filterIndex,
                    onFilterChanged: (index) {
                      _activeFilter.value = index;
                      final regions = ['all', 'cairo', 'giza', 'alex'];
                      context.read<HallsCubit>().getAllHalls(
                        region: index == 0 ? null : regions[index],
                        searchQuery: _searchCtrl.text,
                      );
                    },
                  );
                },
              ),
            ),

            // Results Summary & Grid depending on state
            BlocBuilder<HallsCubit, HallsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (message) =>
                      SliverFillRemaining(child: Center(child: Text(message))),
                  loaded: (halls, _) {
                    return SliverMainAxisGroup(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: context.hp(2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ResponsiveText(
                                  l10n.search_results,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(color: AppColors.outline),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ResponsiveText(
                                      l10n.halls_elite,
                                      style: Theme.of(context).textTheme.titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.onSurface,
                                          ),
                                    ),
                                    ResponsiveText(
                                      l10n.halls_available(halls.length),
                                      style: Theme.of(context).textTheme.labelSmall
                                          ?.copyWith(color: AppColors.outline),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(
                            bottom: context.hp(12),
                          ),
                          sliver: ResponsiveGrid.sliver(
                            maxCrossAxisExtent: context.isMobile ? 200 : 300,
                            mainAxisSpacing: context.wp(AppPadding.baseHori),
                            crossAxisSpacing: context.wp(AppPadding.baseHori),
                            childAspectRatio: context.isMobile ? 0.62 : 0.75,
                            itemCount: halls.length,
                            itemBuilder: (context, index) {
                              final hall = halls[index];
                              return InkWell(
                                onTap: () => context.push(
                                  AppRoutes.hallDetails,
                                  extra: hall,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                child: HallGridCard(
                                  name: hall.name,
                                  region: hall.region ?? '',
                                  capacity: hall.capacity ?? 0,
                                  price: hall.pricePerEvent ?? 0,
                                  rating: hall.avgRating ?? 0,
                                  imageUrl: hall.images.isNotEmpty
                                      ? hall.images.first
                                      : 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?q=80&w=600&auto=format&fit=crop',
                                  isFavorite: false,
                                  onFavoriteToggle: () {},
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
