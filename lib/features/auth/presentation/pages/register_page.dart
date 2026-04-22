import 'package:al_qaah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_logo.dart';
import '../widgets/register_footer.dart';
import '../widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (user) {
              AppSnackBar.success(
                context,
                'مرحباً ${user.name ?? ''}! تم إنشاء حسابك بنجاح',
              );
              context.go(AppRoutes.home);
            },
            error: (message) {
              debugPrint(message);
              AppSnackBar.error(context, message);
            },
          );
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  const AuthLogo(),
                  const SizedBox(height: 40),
                  AuthHeader(
                    title: AppLocalizations.of(context)!.register_title,
                    subtitle: AppLocalizations.of(context)!.register_subtitle,
                  ),
                  const SizedBox(height: 48),
                  const RegisterForm(),
                  const SizedBox(height: 16),
                  const RegisterFooter(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
