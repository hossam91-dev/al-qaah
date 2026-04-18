import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/login_logo.dart';
import '../widgets/register_footer.dart';
import '../widgets/register_form.dart';
import '../widgets/register_header.dart';

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
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  SizedBox(height: 10),
                  LoginLogo(),
                  SizedBox(height: 40),
                  RegisterHeader(),
                  SizedBox(height: 48),
                  RegisterForm(),
                  SizedBox(height: 16),
                  RegisterFooter(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
