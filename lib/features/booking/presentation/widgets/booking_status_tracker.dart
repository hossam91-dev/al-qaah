import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';

class BookingStatusTracker extends StatelessWidget {
  final int currentStatus; // 0: Pending, 1: Accepted, 2: Confirmed

  const BookingStatusTracker({super.key, this.currentStatus = 1});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(24),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStep(
                label: l10n.status_pending,
                isActive: currentStatus >= 0,
                isCompleted: currentStatus > 0,
                icon: Icons.check,
              ),
              _buildDivider(isCompleted: currentStatus > 0),
              _buildStep(
                label: l10n.status_accepted,
                isActive: currentStatus >= 1,
                isCompleted: currentStatus > 1,
                icon: Icons.more_horiz,
              ),
              _buildDivider(isCompleted: currentStatus > 1),
              _buildStep(
                label: l10n.status_confirmed,
                isActive: currentStatus >= 2,
                isCompleted: currentStatus > 2,
                icon: Icons.settings_outlined,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            l10n.booking_accepted_msg,
            textAlign: TextAlign.center,
            style: AppTextStyles.tajawal(
              fontSize: 12,
              color: AppColors.outline,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required String label,
    required bool isActive,
    required bool isCompleted,
    required IconData icon,
  }) {
    //final color = isActive ? AppColors.primary : AppColors.surfaceContainerHigh;
    //final iconColor = isActive ? Colors.white : AppColors.outline;

    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
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
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.tajawal(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? AppColors.onSurface : AppColors.outline,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider({required bool isCompleted}) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
        color: isCompleted
            ? AppColors.primary
            : AppColors.outlineVariant.withValues(alpha: 0.3),
      ),
    );
  }
}
