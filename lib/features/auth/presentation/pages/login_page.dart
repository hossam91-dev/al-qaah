import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils/responsive_text.dart';
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
            padding: EdgeInsets.symmetric(
              horizontal: context.wp(5).clamp(16.0, 32.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: context.hp(5).clamp(24.0, 60.0)),
                const AuthLogo(),
                SizedBox(height: context.hp(6).clamp(32.0, 72.0)),
                AuthHeader(
                  title: l10n.login_title,
                  subtitle: l10n.login_subtitle,
                ),
                SizedBox(height: context.hp(5).clamp(24.0, 56.0)),
                const LoginForm(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => context.push(AppRoutes.forgotPassword),
                    child: ResponsiveText(
                      l10n.forgot_password,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.hp(4).clamp(20.0, 48.0)),
                const LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
