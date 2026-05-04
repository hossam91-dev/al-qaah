import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/features/home/presentation/widgets/ai_recommendation_card.dart';
import 'package:al_qaah/features/home/presentation/widgets/browse_venues_card.dart';
import 'package:al_qaah/features/home/presentation/widgets/featured_venues_header.dart';
import 'package:al_qaah/features/home/presentation/widgets/hero_section.dart';
import 'package:al_qaah/features/home/presentation/widgets/home_app_bar.dart';
import 'package:al_qaah/features/home/presentation/widgets/newsletter_section.dart';
import 'package:al_qaah/features/home/presentation/widgets/venue_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHighestRatedHall(),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          context.wp(5).clamp(16.0, 24.0),
          context.hp(5).clamp(24.0, 48.0),
          context.wp(5).clamp(16.0, 24.0),
          context.hp(12).clamp(80.0, 120.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HomeAppBar(),
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
