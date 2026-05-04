import 'package:al_qaah/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/login_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/register_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/reset_password_page.dart';
import 'package:al_qaah/features/design_system/presentation/pages/design_system_page.dart';
import 'package:al_qaah/features/halls/presentation/screens/hall_details_screen.dart';
import 'package:al_qaah/features/home/domain/entities/hall_entity.dart';
import 'package:al_qaah/features/main_layout/presentation/pages/main_layout_page.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: Supabase.instance.client.auth.currentSession != null
        ? AppRoutes.home
        : AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        name: 'otpVerification',
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return OtpVerificationPage(email: email);
        },
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        name: 'resetPassword',
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.designSystem,
        name: 'designSystem',
        builder: (context, state) => const DesignSystemPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const MainLayoutPage(),
      ),
      GoRoute(
        path: AppRoutes.hallDetails,
        name: 'hallDetails',
        builder: (context, state) {
          final hall = state.extra as HallEntity;
          return HallDetailsScreen(hall: hall);
        },
      ),
    ],
  );
}
