import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
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
            offset: Offset(0, -context.hp(4)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
              child: Row(
                children: [
                  Expanded(
                    child: ProfileStatsCard(
                      label: l10n.bookings_count,
                      value: '4',
                    ),
                  ),
                  SizedBox(width: context.wp(3)),
                  Expanded(
                    child: ProfileStatsCard(
                      label: l10n.saved_halls_count,
                      value: '12',
                    ),
                  ),
                  SizedBox(width: context.wp(3)),
                  Expanded(
                    child: ProfileStatsCard(
                      label: l10n.reviews_count,
                      value: '8',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu Sections
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.wp(5),
              0,
              context.wp(5),
              context.hp(12),
            ),
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
                SizedBox(height: context.hp(3)),

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
                SizedBox(height: context.hp(3)),

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
                SizedBox(height: context.hp(5)),

                // Logout Button
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout_rounded,
                    size: context.sp(5).clamp(18.0, 24.0),
                  ),
                  label: ResponsiveText(
                    l10n.logout,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.wp(10),
                      vertical: context.hp(1.5),
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
