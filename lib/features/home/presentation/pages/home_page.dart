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
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            const SizedBox(height: 40),
            const HeroSection(),
            const SizedBox(height: 40),
            const BrowseVenuesCard(),
            const SizedBox(height: 20),
            const AiRecommendationCard(),
            const SizedBox(height: 40),
            const FeaturedVenuesHeader(),
            const SizedBox(height: 20),
            const VenueCard(),
            const SizedBox(height: 40),
            const NewsletterSection(),
          ],
        ),
      ),
    );
  }
}
