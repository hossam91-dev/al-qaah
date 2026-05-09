import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils/responsive_helper.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_header.dart';
import '../widgets/otp_verification_form.dart';

class OtpVerificationPage extends StatelessWidget {
  final String email;
  const OtpVerificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          otpVerified: () => context.push(AppRoutes.resetPassword),
          error: (message) => AppSnackBar.error(context, message),
        );
      },
      child: _OtpVerificationView(email: email),
    );
  }
}

class _OtpVerificationView extends StatefulWidget {
  final String email;
  const _OtpVerificationView({required this.email});

  @override
  State<_OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<_OtpVerificationView> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
            size: context.sp(5).clamp(18.0, 24.0),
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(5).clamp(16.0, 32.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.hp(2).clamp(10.0, 32.0)),
            const AuthLogo(),
            SizedBox(height: context.hp(6).clamp(32.0, 72.0)),
            AuthHeader(
              title: l10n.otp_title,
              subtitle: '${l10n.otp_subtitle}\n${widget.email}',
            ),
            SizedBox(height: context.hp(5).clamp(24.0, 56.0)),
            OtpVerificationForm(
              controller: _otpController,
              email: widget.email,
            ),
          ],
        ),
      ),
    );
  }
}
