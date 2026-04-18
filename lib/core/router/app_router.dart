import 'package:al_qaah/features/auth/presentation/pages/login_page.dart';
import 'package:al_qaah/features/design_system/presentation/pages/design_system_page.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.designSystem,
        name: 'designSystem',
        builder: (context, state) => const DesignSystemPage(),
      ),
      // Redirect home to login for now
      GoRoute(
        path: AppRoutes.home,
        redirect: (context, state) => AppRoutes.login,
      ),
    ],
  );
}
