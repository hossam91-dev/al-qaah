import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/core/widgets/base_app_bar.dart';
import 'package:al_qaah/features/home/presentation/widgets/ai_recommendation_card.dart';
import 'package:al_qaah/features/home/presentation/widgets/browse_venues_card.dart';
import 'package:al_qaah/features/home/presentation/widgets/featured_venues_header.dart';
import 'package:al_qaah/features/home/presentation/widgets/hero_section.dart';
import 'package:al_qaah/features/home/presentation/widgets/newsletter_section.dart';
import 'package:al_qaah/features/home/presentation/widgets/venue_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/padding.dart';
import '../bloc/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeCubit>().getHighestRatedHall();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(AppPadding.baseHori),
          vertical: context.hp(AppPadding.baseVert),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BaseAppBar(),
            SizedBox(height: context.hp(5).clamp(24.0, 48.0)),
            const HeroSection(),
            SizedBox(height: context.hp(5).clamp(24.0, 48.0)),
            const BrowseVenuesCard(),
            SizedBox(height: context.hp(3).clamp(16.0, 32.0)),
            const AiRecommendationCard(),
            SizedBox(height: context.hp(5).clamp(24.0, 48.0)),
            const FeaturedVenuesHeader(),
            SizedBox(height: context.hp(3).clamp(16.0, 32.0)),
            const VenueCard(),
            SizedBox(height: context.hp(5).clamp(24.0, 48.0)),
            const NewsletterSection(),
          ],
        ),
      ),
    );
  }
}
