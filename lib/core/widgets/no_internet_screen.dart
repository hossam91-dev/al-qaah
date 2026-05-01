import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'base_helper_screen.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternetScreen({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BaseHelperScreen(
      icon: const Icon(
        Icons.wifi_off_rounded,
        size: 64,
        color: AppColors.primary,
      ),
      title: l10n.no_internet_title,
      description: l10n.no_internet_desc,
      actionText: l10n.no_internet_button,
      onActionPressed: onRetry,
    );
  }
}
