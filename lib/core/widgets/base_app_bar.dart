import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../utils/responsive_utils/responsive_text.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  l10n.greeting,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.outline,
                  ),
                ),
                ResponsiveText(
                  state.maybeWhen(
                    success: (user) => user.name ?? "ضيف",
                    orElse: () => "ضيف",
                  ),
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
      },
    );
  }
}
