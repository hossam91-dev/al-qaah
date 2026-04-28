import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_stats_card.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/profile_menu_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          const ProfileHeader(
            name: 'نور محمد',
            phone: '01xxxxxxxxx',
            imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
          ),

          // Stats Section
          Transform.translate(
            offset: const Offset(0, -40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ProfileStatsCard(label: l10n.bookings_count, value: '4'),
                  const SizedBox(width: 12),
                  ProfileStatsCard(label: l10n.saved_halls_count, value: '12'),
                  const SizedBox(width: 12),
                  ProfileStatsCard(label: l10n.reviews_count, value: '8'),
                ],
              ),
            ),
          ),

          // Menu Sections
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              100,
            ), // Increased bottom padding
            child: Column(
              children: [
                // Account Section
                ProfileMenuSection(
                  title: l10n.account_section,
                  children: [
                    ProfileMenuItem(
                      icon: Icons.person_outline_rounded,
                      title: l10n.edit_personal_data,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.phone_outlined,
                      title: l10n.change_mobile_number,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.lock_outline_rounded,
                      title: l10n.change_password,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // My Bookings Section
                ProfileMenuSection(
                  title: l10n.my_bookings_section,
                  children: [
                    ProfileMenuItem(
                      icon: Icons.calendar_month_outlined,
                      title: l10n.current_bookings,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.history_rounded,
                      title: l10n.bookings_history,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.favorite_border_rounded,
                      title: l10n.saved_halls,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Support Section
                ProfileMenuSection(
                  title: l10n.support_section,
                  children: [
                    ProfileMenuItem(
                      icon: Icons.support_agent_rounded,
                      title: l10n.contact_us,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.star_border_rounded,
                      title: l10n.app_rating,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.description_outlined,
                      title: l10n.terms_and_privacy,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Logout Button
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout_rounded, size: 20),
                  label: Text(
                    l10n.logout,
                    style: AppTextStyles.tajawal(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
