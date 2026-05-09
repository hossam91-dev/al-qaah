import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:al_qaah/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/login_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/register_page.dart';
import 'package:al_qaah/features/auth/presentation/pages/reset_password_page.dart';
import 'package:al_qaah/features/halls/domain/entities/hall_entity.dart';
import 'package:al_qaah/features/halls/presentation/screens/hall_details_screen.dart';
import 'package:al_qaah/features/main_layout/presentation/pages/main_layout_page.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_qaah/core/di/injection.dart';
import 'package:al_qaah/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:al_qaah/features/home/presentation/bloc/home_cubit.dart';
import 'package:al_qaah/features/halls/presentation/bloc/halls_cubit.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text(
          'الصفحة غير موجودة',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    redirect: (context, state) {
      final isLoggedIn = Supabase.instance.client.auth.currentSession != null;
      final currentLocation = state.matchedLocation;

      // Auth-only routes (unauthenticated users only)
      final isAuthRoute = [
        AppRoutes.login,
        AppRoutes.register,
        AppRoutes.forgotPassword,
        AppRoutes.otpVerification,
      ].contains(currentLocation);

      // Reset password is accessible when logged in (password recovery flow)
      if (currentLocation == AppRoutes.resetPassword) return null;

      if (!isLoggedIn && !isAuthRoute) return AppRoutes.login;
      if (isLoggedIn && isAuthRoute) return AppRoutes.home;
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: child,
        ),
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
        ],
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<HomeCubit>()..getHighestRatedHall()),
            BlocProvider(create: (_) => getIt<HallsCubit>()..getAllHalls()),
            BlocProvider(create: (_) => getIt<AuthCubit>()..checkAuth()),
          ],
          child: const MainLayoutPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.hallDetails,
        name: 'hallDetails',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is HallEntity) {
            return HallDetailsScreen(hall: extra);
          }
          final hallId = state.uri.queryParameters['id'];
          if (hallId == null || hallId.isEmpty) {
            return const Scaffold(
              body: Center(child: Text('لم يتم العثور على القاعة')),
            );
          }
          return HallDetailsScreen(hallId: hallId);
        },
      ),
    ],
  );
}
