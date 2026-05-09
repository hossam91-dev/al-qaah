import 'package:al_qaah/core/di/injection.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/features/halls/presentation/bloc/halls_cubit.dart';
import 'package:al_qaah/features/halls/presentation/bloc/halls_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/padding.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/hall_entity.dart';
import '../widgets/hall_details_header.dart';
import '../widgets/hall_info_section.dart';
import '../widgets/hall_features_grid.dart';
import '../widgets/hall_booking_bar.dart';
import '../widgets/hall_availability_calendar.dart';
import '../widgets/hall_location_map.dart';

class HallDetailsScreen extends StatelessWidget {
  final HallEntity? hall;
  final String? hallId;

  const HallDetailsScreen({super.key, this.hall, this.hallId})
    : assert(hall != null || hallId != null, 'Either hall or hallId must be provided');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HallsCubit>()..getHallById(hallId!),
      child: BlocBuilder<HallsCubit, HallsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const  Center(child: CircularProgressIndicator()),

            loaded: (halls, selectedHall) {
              if (selectedHall != null) {
                return _HallDetailsContent(hall: selectedHall);
              }
              return const Center(child: Text('Hall not found'));

            },
            error: (message) => Center(child: Text(message)),

            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _HallDetailsContent extends StatelessWidget {
  final HallEntity hall;

  const _HallDetailsContent({required this.hall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(AppPadding.baseHori),
          vertical: context.hp(AppPadding.baseVert),
        ),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                HallDetailsHeader(
                  images: hall.images,
                  onBack: () => context.pop(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(32),
                        right: Radius.circular(32),
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    child: Column(
                    children: [
                      HallInfoSection(
                        name: hall.name,
                        price: hall.pricePerEvent ?? 0,
                        rating: hall.avgRating ?? 0.0,
                        reviewsCount: 120, // Mock reviews count
                        description:
                            hall.description ??
                            'تجربة ملكية فريدة في قلب القاهرة، تجمع بين العمارة الكلاسيكية والخدمات العصرية الراقية لتجعل من ليلة زفافكم ذكرى لا تُنسى.',
                      ),
                      SizedBox(height: context.hp(5)),
                      HallFeaturesGrid(
                        capacity: hall.capacity ?? 500,
                        amenities: hall.amenities,
                      ),
                      SizedBox(height: context.hp(5)),
                      const HallAvailabilityCalendar(),
                      SizedBox(height: context.hp(5)),
                      const HallLocationMap(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Sticky Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HallBookingBar(
              price: hall.pricePerEvent ?? 0,
              onBookNow: () {},
            ),
          ),
        ],
      ),
    ));
  }
}
