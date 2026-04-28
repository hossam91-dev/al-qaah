import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/validation_utils.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../bloc/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().register(
        fullName: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
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
            label: l10n.full_name,
            hintText: l10n.full_name_hint,
            controller: _nameController,
            keyboardType: TextInputType.name,
            prefixIcon: Icons.person_outline,
            validator: (value) =>
                ValidationUtils.validateFullName(context, value),
          ),
          const SizedBox(height: 24),
          AppTextField(
            label: l10n.email,
            hintText: "example@email.com",
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
            validator: (value) => ValidationUtils.validateEmail(context, value),
          ),
          const SizedBox(height: 24),
          AppTextField(
            label: l10n.password,
            hintText: l10n.password_hint,
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
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          const SizedBox(height: 24),
          AppTextField(
            label: l10n.confirm_password,
            hintText: l10n.confirm_password_hint,
            controller: _confirmPasswordController,
            isPassword: !_isConfirmPasswordVisible,
            prefixIcon: Icons.lock_outline,
            validator: (value) => ValidationUtils.validateConfirmPassword(
              context,
              _passwordController.text,
              value,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmPasswordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.outline,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
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
                text: l10n.register_button,
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
