import 'package:dating_app/blocs/authentication_example/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/bloc/authentication_bloc.dart';
import '../blocs/authentication/bloc/authentication_repository.dart';
import '../blocs/database/bloc/database_bloc.dart';
import '../blocs/database/database_repository_impl.dart';
import '../blocs/database/home_view.dart';
import '../blocs/from-validation/bloc/form_bloc.dart';
import '../blocs/welcome_view.dart';
import '../di/service_locator.dart';
import '../domain/repositories/example_repository.dart';
import '../l10n/l10n.dart';
import '../navigation/navigation.dart';
import '../screens/home/home_screen.dart';
import '../screens/signin/sign_in_screen.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiRepositoryProvider(
    //   providers: [
    //     RepositoryProvider<ExampleRepository>(
    //       create: (BuildContext context) =>
    //           ServiceLocator.inject<ExampleRepository>(),
    //     ),
    //   ],
    //   child: MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         create: (context) => AuthenticationCubit(),
    //       ),
    //     ],
    //     child: const AppView(),
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(AuthenticationRepositoryImpl())
                ..add(AuthenticationStarted()),
        ),
        BlocProvider(
          create: (context) => FormBloc(
              AuthenticationRepositoryImpl(), DatabaseRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(DatabaseRepositoryImpl()),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: MaterialApp.router(
    //     debugShowCheckedModeBanner: false,
    //     theme: AppTheme.light,
    //     darkTheme: AppTheme.dark,
    //     localizationsDelegates: AppLocalizations.localizationsDelegates,
    //     supportedLocales: AppLocalizations.supportedLocales,
    //     routerConfig: AppRouter.routerConfig,

    //   ),
    // );

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const BlocNavigate(),
      ),
    );
  }
}

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const HomeView();
        } else {
          return const WelcomeView();
        }
      },
    );
  }
}
