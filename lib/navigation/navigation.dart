import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../common/error_screen.dart';
import '../screens/auth/code/code.dart';
import '../screens/home/home_screen.dart';
import '../screens/home_example/home.dart';
import '../screens/login/login.dart';
import '../screens/auth/numberphone/number_phone.dart';
import '../screens/auth/auth.dart';
import '../screens/auth/signup/sign_up_screen.dart';
import '../screens/main_screen.dart';

abstract class NavigationPath {
  NavigationPath._();
  static const onboarding = '/onboarding';
  static const signup = '/signup';
  static const numberphone = '/numberphone';
  static const code = '/code';
  static const home = '/home';
  static const login = '/';
  static const genderScreen = '/genderScreen';
  static const passionScreen = '/passionScreen';
  static const friendScreen = '/friendScreen';
  static const notificationScreen = '/notificationScreen';
  static const profile = '/profileScreen';
  static const homeScreen = '/homeScreen';
  static const mainScreen = '/:tab';

}

abstract class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: NavigationPath.onboarding,
    // initialLocation: NavigationPath.homeScreen,
    redirect: (context, _) {
      if (context.read<AuthenticationCubit>().state) {
        return NavigationPath.mainScreen.replaceFirst(':tab', '0');
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: NavigationPath.home,
        builder: (_, __) => const HomeScreenExample(),
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
      GoRoute(
        path: NavigationPath.genderScreen,
        builder: (_, __) => const GenderScreen(),
      ),
      GoRoute(
        path: NavigationPath.passionScreen,
        builder: (_, __) =>  const PassionScreen(),
      ),
      GoRoute(
        path: NavigationPath.friendScreen,
        builder: (_, __) => const FriendScreen(),
      ),
      GoRoute(
        path: NavigationPath.notificationScreen,
        builder: (_, __) => const NotificationScreen(),
      ),
      GoRoute(
        path: NavigationPath.profile,
        builder: (_, __) => const ProfileScreen(),
        
      ),
      GoRoute(
        path: NavigationPath.homeScreen,
        builder: (_, __) => const HomeScreen(),
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
        }
      ),
    ],
    errorBuilder: (_, __) => const ErrorScreen(),
  );
}
