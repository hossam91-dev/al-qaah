import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/responsive_utils/responsive_text.dart';
import '../../../../../core/utils/responsive_utils/responsive_helper.dart';
import '../../../../l10n/app_localizations.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.push(AppRoutes.login),
              child: ResponsiveText(
                l10n.login_now,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            ResponsiveText(
              l10n.already_have_account,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        SizedBox(height: context.hp(2)),
        ResponsiveText(
          l10n.terms_and_conditions,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }
}
