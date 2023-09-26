import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../common/error_screen.dart';
import '../screens/signup/auth_screen.dart';
import '../screens/home/user_profile/user_profile_screen.dart';
import '../screens/main_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
abstract class NavigationPath {
  NavigationPath._();
  static const login = '/login';
  static const home = '/home';

  static const onboardingScreen = '/onboarding';
  static const signupScreen = '/signup';
  static const homeScreen = '/homeScreen';
  static const mainScreen = '/:tab';
  static const userProfileScreen = 'userProfile/:id';

}

abstract class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: NavigationPath.onboardingScreen,
    // initialLocation: NavigationPath.homeScreen,
    redirect: (context, _) {
      if (context.read<AuthenticationCubit>().state) {
        return NavigationPath.mainScreen.replaceFirst(':tab', '0');
      } else {
        return null;
      }
    },
    routes: [
      // GoRoute(
      //   path: NavigationPath.home,
      //   builder: (_, __) => const HomeScreenExample(),
      // ),
      // GoRoute(
      //   path: NavigationPath.login,
      //   builder: (_, __) => const LoginScreen(),
      // ),
      GoRoute(
        path: NavigationPath.onboardingScreen,
        builder: (_, __) => const Onboarding(),
      ),
      GoRoute(
        path: NavigationPath.signupScreen,
        builder: (_, __) => const AuthScreen(),
      ),
      GoRoute(
        name: 'main',
        path: NavigationPath.mainScreen,
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '0') ?? 0;
            return MainScreen(
              key: state.pageKey,
              currentTab: tab,
            );
        },
        routes: [
           GoRoute(
            name: 'userProfile',
            path: NavigationPath.userProfileScreen,
            builder: (context, state) {
              return UserProfileScreen(
                key: state.pageKey,
                id: state.params['id'] as String,
              );
            },
          ),
        ],
      ),
       
    ],
    errorBuilder: (_, __) => const ErrorScreen(),
  );
}
