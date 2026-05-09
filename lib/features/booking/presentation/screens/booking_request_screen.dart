import 'package:al_qaah/core/constants/padding.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/core/widgets/base_app_bar.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(AppPadding.baseHori),
          vertical: context.hp(AppPadding.baseVert),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseAppBar(),
            Column(
              children: [
                const BookingStatusTracker(currentStatus: 1),
                SizedBox(height: context.hp(3)),
                const BookingHallDetailsCard(),
                SizedBox(height: context.hp(3)),
                const BookingActionsCard(totalPrice: 85000),
                SizedBox(height: context.hp(3)),
                const BookingReferenceCard(referenceNumber: 'LF-88421#'),
                SizedBox(height: context.hp(3)),
                const BookingCancellationPolicy(),
                SizedBox(height: context.hp(12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
