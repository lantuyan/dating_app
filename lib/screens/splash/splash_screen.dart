// splash_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../navigation/navigation.dart';
import 'splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..loadSplash(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state == SplashState.loaded) {
             context.go(NavigationPath.signinScreen);
            }
          },
          child: const Center(
            child: FlutterLogo(size: 200),
          ),
        ),
      ),
    );

    // return Center(
    //   child: FlutterLogo(size: 200),
    // );
  }
}
