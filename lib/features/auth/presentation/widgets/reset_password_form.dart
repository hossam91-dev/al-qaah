import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().updatePassword(_passwordController.text);
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
            label: l10n.new_password,
            hintText: l10n.new_password_hint,
            controller: _passwordController,
            isPassword: !_isPasswordVisible,
            prefixIcon: Icons.lock_outline,
            validator: (value) =>
                ValidationUtils.validatePassword(context, value),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.outline,
                size: 20,
              ),
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
          ),
          const SizedBox(height: 24),
          AppTextField(
            label: l10n.confirm_password,
            hintText: l10n.confirm_password_hint,
            controller: _confirmPasswordController,
            isPassword: !_isPasswordVisible,
            prefixIcon: Icons.lock_reset_outlined,
            validator: (value) => ValidationUtils.validateConfirmPassword(
              context,
              _passwordController.text,
              value,
            ),
          ),
          const SizedBox(height: 48),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return AppButton.primary(
                text: l10n.update_password_button,
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
