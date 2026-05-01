import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'base_helper_screen.dart';

class EmptyStateScreen extends StatelessWidget {
  final VoidCallback? onResetSearch;

  const EmptyStateScreen({super.key, this.onResetSearch});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BaseHelperScreen(
      icon: const Icon(
        Icons.search_off_rounded,
        size: 64,
        color: AppColors.primary,
      ),
      title: l10n.empty_state_title,
      description: l10n.empty_state_desc,
      actionText: l10n.empty_state_button,
      onActionPressed: onResetSearch,
    );
  }
}
