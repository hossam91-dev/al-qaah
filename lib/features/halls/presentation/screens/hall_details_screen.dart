import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/domain/entities/hall_entity.dart';
import '../widgets/hall_details_header.dart';
import '../widgets/hall_info_section.dart';
import '../widgets/hall_features_grid.dart';
import '../widgets/hall_booking_bar.dart';
import '../widgets/hall_availability_calendar.dart';
import '../widgets/hall_location_map.dart';

class HallDetailsScreen extends StatelessWidget {
  final HallEntity hall;

  const HallDetailsScreen({super.key, required this.hall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              HallDetailsHeader(
                images: hall.images,
                onBack: () => Navigator.of(context).pop(),
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
                  padding: EdgeInsets.fromLTRB(
                    context.wp(5),
                    context.hp(4),
                    context.wp(5),
                    context.hp(15),
                  ),
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
    );
  }
}
