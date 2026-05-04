import 'package:al_qaah/core/theme/app_colors.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      spacing: context.wp(2),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveText(
              l10n.greeting,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
            ResponsiveText(
              'ياسمين', // Mock user name
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: context.sp(5).clamp(18.0, 24.0),
          backgroundImage: const NetworkImage(
            'https://i.pravatar.cc/150?img=5',
          ),
        ),
      ],
    );
  }
}
