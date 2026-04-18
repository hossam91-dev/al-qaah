import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Center(
          child: Text(
            l10n.terms_and_conditions,
            style: AppTextStyles.tajawal(
              fontSize: 12,
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => context.go(AppRoutes.login),
                child: Text(
                  l10n.login_now,
                  style: AppTextStyles.tajawal(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                l10n.already_have_account,
                style: AppTextStyles.tajawal(color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
