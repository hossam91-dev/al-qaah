import 'package:al_qaah/core/theme/app_colors.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BrowseVenuesCard extends StatelessWidget {
  const BrowseVenuesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: context.hp(28).clamp(200.0, 280.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?q=80&w=2098&auto=format&fit=crop',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0.1),
              AppColors.primary.withValues(alpha: 0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(context.wp(6).clamp(16.0, 32.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveText(
              l10n.browse_halls,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: context.hp(1)),
            ResponsiveText(
              l10n.browse_halls_desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            SizedBox(height: context.hp(3).clamp(16.0, 32.0)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.wp(8).clamp(24.0, 40.0),
                vertical: context.hp(1.5).clamp(10.0, 16.0),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ResponsiveText(
                    l10n.explore_now,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: context.wp(2)),
                  Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.primary,
                    size: context.sp(4.5).clamp(16.0, 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
