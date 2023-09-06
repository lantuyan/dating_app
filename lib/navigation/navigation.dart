import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../common/error_screen.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/singup/i_am_screen.dart';

abstract class NavigationPath {
  NavigationPath._();
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const login = '/';
}

abstract class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: NavigationPath.onboarding,
    redirect: (context, _) {
      if (context.read<AuthenticationCubit>().state) {
        return NavigationPath.home;
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: NavigationPath.home,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: NavigationPath.login,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: NavigationPath.onboarding,
        builder: (_, __) => const IAmScreen(),
      ),
    ],
    errorBuilder: (_, __) => const ErrorScreen(),
  );
}
