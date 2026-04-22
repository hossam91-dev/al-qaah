import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_cubit.dart';

class ForgotPasswordForm extends StatelessWidget {
  final TextEditingController controller;
  const ForgotPasswordForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        AppTextField(
          label: l10n.email,
          hintText: "example@email.com",
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
        ),
        const SizedBox(height: 48),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            return AppButton.primary(
              text: l10n.send_code_button,
              isLoading: isLoading,
              onPressed: () =>
                  context.read<AuthCubit>().sendResetCode(controller.text),
            );
          },
        ),
      ],
    );
  }
}
