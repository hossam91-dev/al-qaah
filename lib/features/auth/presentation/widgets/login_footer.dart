import 'package:flutter/material.dart';
import 'package:al_qaah/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              l10n.create_account,
              style: AppTextStyles.tajawal(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            l10n.dont_have_account,
            style: AppTextStyles.tajawal(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
