import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class BookingReferenceCard extends StatelessWidget {
  final String referenceNumber;

  const BookingReferenceCard({super.key, required this.referenceNumber});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(6),
        vertical: context.hp(2),
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.qr_code_2_rounded,
            size: context.sp(8).clamp(32.0, 48.0),
            color: AppColors.onSurface,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ResponsiveText(
                l10n.reference_number,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: AppColors.outline),
              ),
              ResponsiveText(
                referenceNumber,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
