import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class BookingActionsCard extends StatelessWidget {
  final double totalPrice;

  const BookingActionsCard({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(context.wp(6)),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                l10n.total_cost,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.onPrimaryContainer.withValues(alpha: 0.7),
                ),
              ),
              ResponsiveText(
                '${totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} ${l10n.currency_egp}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: context.hp(3)),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.payments_outlined,
              size: context.sp(5).clamp(18.0, 24.0),
            ),
            label: ResponsiveText(
              l10n.pay_now,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              minimumSize: Size(
                double.infinity,
                context.hp(7).clamp(48.0, 60.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(height: context.hp(1.5)),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              size: context.sp(5).clamp(18.0, 24.0),
            ),
            label: ResponsiveText(
              l10n.contact_hall,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white24),
              minimumSize: Size(
                double.infinity,
                context.hp(7).clamp(48.0, 60.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
