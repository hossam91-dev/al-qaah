import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_container.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../l10n/app_localizations.dart';

class HallBookingBar extends StatelessWidget {
  final double price;
  final VoidCallback onBookNow;

  const HallBookingBar({
    super.key,
    required this.price,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ResponsiveContainer(
      widthPercent: 100,
      paddingPercent: 4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ResponsiveText(
                l10n.total_estimated,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.outline),
              ),
              ResponsiveText(
                '${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} ${l10n.currency_egp}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: context.wp(40).clamp(140.0, 200.0),
            child: AppButton.primary(
              text: l10n.book_now_cta,
              onPressed: onBookNow,
            ),
          ),
        ],
      ),
    );
  }
}
