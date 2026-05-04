import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class BookingStatusTracker extends StatelessWidget {
  final int currentStatus; // 0: Pending, 1: Accepted, 2: Confirmed

  const BookingStatusTracker({super.key, this.currentStatus = 1});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(context.wp(6)),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildStep(
                  context: context,
                  label: l10n.status_pending,
                  isActive: currentStatus >= 0,
                  isCompleted: currentStatus > 0,
                  icon: Icons.check,
                ),
              ),
              _buildDivider(context, isCompleted: currentStatus > 0),
              Expanded(
                child: _buildStep(
                  context: context,
                  label: l10n.status_accepted,
                  isActive: currentStatus >= 1,
                  isCompleted: currentStatus > 1,
                  icon: Icons.more_horiz,
                ),
              ),
              _buildDivider(context, isCompleted: currentStatus > 1),
              Expanded(
                child: _buildStep(
                  context: context,
                  label: l10n.status_confirmed,
                  isActive: currentStatus >= 2,
                  isCompleted: currentStatus > 2,
                  icon: Icons.settings_outlined,
                ),
              ),
            ],
          ),
          SizedBox(height: context.hp(3)),
          ResponsiveText(
            l10n.booking_accepted_msg,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.outline,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required BuildContext context,
    required String label,
    required bool isActive,
    required bool isCompleted,
    required IconData icon,
  }) {
    final stepSize = context.sp(10).clamp(32.0, 48.0);
    return Column(
      children: [
        Container(
          width: stepSize,
          height: stepSize,
          decoration: BoxDecoration(
            color: isCompleted
                ? AppColors.primary
                : (isActive
                      ? AppColors.primary
                      : AppColors.surfaceContainerLow),
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.primary : AppColors.outlineVariant,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: isCompleted || isActive
                ? Colors.white
                : AppColors.outlineVariant,
            size: context.sp(5).clamp(16.0, 24.0),
          ),
        ),
        SizedBox(height: context.hp(1)),
        ResponsiveText(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? AppColors.onSurface : AppColors.outline,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context, {required bool isCompleted}) {
    return Expanded(
      child: Container(
        height: 2,
        margin: EdgeInsets.only(
          left: context.wp(2),
          right: context.wp(2),
          bottom: context.hp(2.5),
        ),
        color: isCompleted
            ? AppColors.primary
            : AppColors.outlineVariant.withValues(alpha: 0.3),
      ),
    );
  }
}
