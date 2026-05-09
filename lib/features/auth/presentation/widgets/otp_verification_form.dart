import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils/responsive_helper.dart';
import '../../../../core/utils/validation_utils.dart';
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
    final pinSize = context.wp(12).clamp(48.0, 64.0);

    final defaultTheme = PinTheme(
      width: pinSize,
      height: pinSize,
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.bold,
        fontSize: AppFontSize.titleLarge,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
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
            separatorBuilder: (index) => SizedBox(width: context.wp(2)),
            validator: (value) => ValidationUtils.validateOtp(context, value),
            onCompleted: (pin) =>
                context.read<AuthCubit>().verifyOtp(email: email, token: pin),
          ),
        ),
        SizedBox(height: context.hp(4).clamp(24.0, 48.0)),
        TextButton(
          onPressed: () => context.read<AuthCubit>().sendResetCode(email),
          child: Text(
            l10n.resend_code,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.titleSmall,
            ),
          ),
        ),
        SizedBox(height: context.hp(2).clamp(8.0, 24.0)),
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
