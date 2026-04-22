import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
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
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            otpVerified: () => context.push(AppRoutes.resetPassword),
            error: (message) => AppSnackBar.error(context, message),
          );
        },
        child: _OtpVerificationView(email: email),
      ),
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
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthLogo(),
            const SizedBox(height: 60),
            AuthHeader(
              title: l10n.otp_title,
              subtitle: '${l10n.otp_subtitle}\n${widget.email}',
            ),
            const SizedBox(height: 48),
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
