import 'package:al_qaah/core/theme/app_colors.dart';
import 'package:al_qaah/core/widgets/app_button.dart';
import 'package:al_qaah/core/widgets/app_card.dart';
import 'package:al_qaah/core/widgets/app_text_field.dart';
import 'package:al_qaah/core/widgets/glassmorphic_container.dart';
import 'package:flutter/material.dart';

class DesignSystemPage extends StatelessWidget {
  const DesignSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Royal Nuptial Design System'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 40),
            children: [
              Text(
                'Typography',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Display Large',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      'Headline Medium',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Title Large',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Body Large - High readability sans-serif',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Body Medium - Luxury 14px look',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'الخط العربي: تجوال (Tajawal)',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Buttons',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              AppButton.primary(text: 'BOOK NOW (PRIMARY)', onPressed: () {}),
              const SizedBox(height: 12),
              AppButton.secondary(text: 'ADD TO FAVORITES', onPressed: () {}),
              const SizedBox(height: 32),
              Text(
                'Form Elements',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              const AppTextField(
                label: 'YOUR NAME',
                hintText: 'Enter your full name',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              const AppTextField(
                label: 'EVENT DATE',
                hintText: 'Select your wedding date',
                prefixIcon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: 32),
              Text(
                'Glassmorphism',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              GlassmorphicContainer(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: AppColors.primary,
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'The Ethereal Concierge',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Backdrop blur with 70% surface opacity for a premium editorial look.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
