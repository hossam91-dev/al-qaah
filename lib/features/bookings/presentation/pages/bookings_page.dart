import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Text(l10n.nav_bookings),
    );
  }
}
