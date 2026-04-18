import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/login_logo.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';
import '../widgets/login_footer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (user) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('مرحباً ${user.name}')));
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
          body: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                LoginLogo(),
                SizedBox(height: 60),
                LoginHeader(),
                SizedBox(height: 48),
                LoginForm(),
                SizedBox(height: 40),
                LoginFooter(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
