import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:al_qaah/l10n/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../bloc/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (user) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('مرحباً ${user.name}')),
              );
              // Navigate to home after success
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // Logo section
                Center(
                  child: Column(
                    children: [
                      Text(
                        'LAFAF',
                        style: GoogleFonts.notoSerif(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                          letterSpacing: 4.0,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 40,
                        color: AppColors.primary,
                        margin: const EdgeInsets.only(top: 8),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 60),

                // Title section
                Text(
                  l10n.login_title,
                  style: AppTextStyles.tajawal(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.login_subtitle,
                  style: AppTextStyles.tajawal(
                    fontSize: 16,
                    color: AppColors.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.right,
                ),

                const SizedBox(height: 48),

                // Form section
                AppTextField(
                  label: l10n.phone_number,
                  hintText: l10n.phone_hint,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_android_outlined,
                ),
                const SizedBox(height: 24),

                AppTextField(
                  label: l10n.password,
                  hintText: l10n.password_hint,
                  controller: _passwordController,
                  isPassword: !_isPasswordVisible,
                  prefixIcon: Icons.lock_outline,
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

                const SizedBox(height: 48),

                // Login Button
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return AppButton.primary(
                      text: l10n.login_button,
                      isLoading: isLoading,
                      onPressed: () {
                        context.read<AuthCubit>().login(
                              _phoneController.text,
                              _passwordController.text,
                            );
                      },
                    );
                  },
                ),

                const SizedBox(height: 40),

                // Footer section
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          l10n.create_account,
                          style: AppTextStyles.tajawal(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        l10n.dont_have_account,
                        style: AppTextStyles.tajawal(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
