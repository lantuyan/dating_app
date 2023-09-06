import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../common/error_screen.dart';
import '../screens/code/code.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/numberphone/number_phone.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/signup/sign_up_screen.dart';

abstract class NavigationPath {
  NavigationPath._();
  static const onboarding = '/onboarding';
  static const signup = '/signup';
  static const numberphone = '/numberphone';
  static const code = '/code';
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
        builder: (_, __) => const Onboarding(),
      ),
      GoRoute(
        path: NavigationPath.signup,
        builder: (_, __) => const SignUpScreen(),
      ),
      GoRoute(
        path: NavigationPath.numberphone,
        builder: (_, __) => const NumberPhoneScreen(),
      ),
      GoRoute(
        path: NavigationPath.code,
        builder: (_, __) => const CodeScreen(),
      ),
    ],
    errorBuilder: (_, __) => const ErrorScreen(),
  );
}
