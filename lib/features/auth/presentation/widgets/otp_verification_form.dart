import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_cubit.dart';

class OtpVerificationForm extends StatelessWidget {
  final TextEditingController controller;
  final String email;
  const OtpVerificationForm({
    super.key,
    required this.controller,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final defaultTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: AppTextStyles.tajawal(
        fontSize: 22,
        color: AppColors.onSurface,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
        color: AppColors.surface,
      ),
    );
    final focusedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 2),
      ),
    );

    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: 6,
            controller: controller,
            defaultPinTheme: defaultTheme,
            focusedPinTheme: focusedTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            onCompleted: (pin) =>
                context.read<AuthCubit>().verifyOtp(email: email, token: pin),
          ),
        ),
        const SizedBox(height: 32),
        TextButton(
          onPressed: () => context.read<AuthCubit>().sendResetCode(email),
          child: Text(
            l10n.resend_code,
            style: AppTextStyles.tajawal(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            return AppButton.primary(
              text: l10n.verify_button,
              isLoading: isLoading,
              onPressed: () => context.read<AuthCubit>().verifyOtp(
                email: email,
                token: controller.text,
              ),
            );
          },
        ),
      ],
    );
  }
}
