import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_logo.dart';
import '../widgets/login_footer.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (user) {
              AppSnackBar.success(context, 'مرحباً ${user.name}');
              context.go(AppRoutes.home);
            },
            error: (message) => AppSnackBar.error(context, message),
          );
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const AuthLogo(),
                const SizedBox(height: 60),
                AuthHeader(
                  title: l10n.login_title,
                  subtitle: l10n.login_subtitle,
                ),
                const SizedBox(height: 48),
                const LoginForm(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => context.push(AppRoutes.forgotPassword),
                    child: Text(
                      l10n.forgot_password,
                      style: AppTextStyles.tajawal(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
