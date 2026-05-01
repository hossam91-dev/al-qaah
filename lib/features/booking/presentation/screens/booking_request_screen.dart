import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/booking_status_tracker.dart';
import '../widgets/booking_hall_details_card.dart';
import '../widgets/booking_actions_card.dart';
import '../widgets/booking_reference_card.dart';
import '../widgets/booking_cancellation_policy.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (Welcome/Context)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.booking_details_royal,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(color: AppColors.outline),
                ),
                Text(
                  l10n.booking_status_tracking,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const BookingStatusTracker(currentStatus: 1),
                const SizedBox(height: 24),
                const BookingHallDetailsCard(),
                const SizedBox(height: 24),
                const BookingActionsCard(totalPrice: 85000),
                const SizedBox(height: 24),
                const BookingReferenceCard(referenceNumber: 'LF-88421#'),
                const SizedBox(height: 24),
                const BookingCancellationPolicy(),
                const SizedBox(height: 100), // Space for Bottom Navigation
              ],
            ),
          ),
        ],
      ),
    );
  }
}
