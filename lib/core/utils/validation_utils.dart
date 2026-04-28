import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ValidationUtils {
  static String? validateEmail(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.validator_email_required;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return l10n.validator_email_invalid;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return l10n.validator_password_required;
    }
    if (value.length < 6) {
      return l10n.validator_password_short;
    }
    return null;
  }

  static String? validateConfirmPassword(
    BuildContext context,
    String? password,
    String? confirmPassword,
  ) {
    final l10n = AppLocalizations.of(context)!;
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return l10n.validator_confirm_password_required;
    }
    if (password != confirmPassword) {
      return l10n.validator_passwords_not_match;
    }
    return null;
  }

  static String? validateFullName(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.validator_name_required;
    }
    if (value.trim().split(' ').length < 2) {
      return l10n.validator_name_short;
    }
    return null;
  }

  static String? validatePhone(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.validator_phone_required;
    }
    final phoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return l10n.validator_phone_invalid;
    }
    return null;
  }

  static String? validateOtp(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.validator_otp_required;
    }
    if (value.trim().length != 6) {
      return l10n.validator_otp_invalid;
    }
    return null;
  }
}
