import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/bloc/authentication_bloc.dart';
import '../blocs/authentication_example/authentication_cubit.dart';
import '../blocs/welcome_view.dart';
import '../common/error_screen.dart';
import '../screens/signin/phone/sign_in_screen.dart';
import '../screens/signup/phone/auth_screen.dart';
import '../screens/home/user_profile/user_profile_screen.dart';
import '../screens/main_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/splash/splash_screen.dart';

abstract class NavigationPath {
  NavigationPath._();
  static const login = '/login';
  static const home = '/home';

  static const welcome = '/welcome';

  static const splashScreen = '/splashScreen';
  static const onboardingScreen = '/onboarding';
  static const signupScreen = '/signup';
  static const signinScreen = '/signin';
  static const homeScreen = '/homeScreen';
  static const mainScreen = '/:tab';
  static const userProfileScreen = 'userProfile/:id';
}

abstract class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: NavigationPath.splashScreen,
    // initialLocation: NavigationPath.homeScreen,
    // redirect: (context, _) {
    //   // if (context.read<AuthenticationCubit>().state) {
    //   //   return NavigationPath.mainScreen.replaceFirst(':tab', '0');
    //   // } else {
    //   //   return null;
    //   // }
    //   if (context.read<AuthenticationBloc>().state is AuthenticationSuccess) {
    //     print("authen success");
    //     return NavigationPath.mainScreen.replaceFirst(':tab', '0');
    //     // return const HomeView();
    //   } else {
    //     // return const WelcomeView();
    //     return NavigationPath.onboardingScreen;
    //   }
    // },
    
    redirect: (context, state) {
      final authenticationState = context.read<AuthenticationBloc>().state;

          if (authenticationState is AuthenticationSuccess) {
            return NavigationPath.mainScreen.replaceFirst(':tab', '0');
          } else {
            return NavigationPath.onboardingScreen;
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
        path: NavigationPath.welcome,
        builder: (_, __) => const WelcomeView(),
      ),
      GoRoute(
        path: NavigationPath.splashScreen,
        builder: (_, __) => SplashScreen(),
      ),
      GoRoute(
        path: NavigationPath.onboardingScreen,
        builder: (_, __) => const Onboarding(),
      ),
      GoRoute(
        path: NavigationPath.signupScreen,
        builder: (_, __) => const SignUpWithPhone(),
      ),
      GoRoute(
        path: NavigationPath.signinScreen,
        builder: (_, __) => const SignIn(),
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
