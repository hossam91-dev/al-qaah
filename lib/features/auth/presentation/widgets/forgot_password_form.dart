import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_cubit.dart';

class ForgotPasswordForm extends StatefulWidget {
  final TextEditingController controller;
  const ForgotPasswordForm({super.key, required this.controller});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().sendResetCode(widget.controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
            label: l10n.email,
            hintText: "example@email.com",
            controller: widget.controller,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
            validator: (value) => ValidationUtils.validateEmail(context, value),
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
                onPressed: isLoading ? () {} : _submit,
              );
            },
          ),
        ],
      ),
    );
  }
}
