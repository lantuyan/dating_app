// splash_bloc.dart

import 'package:dating_app/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { initial, loaded }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial);

  void loadSplash() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    
    // Sau khi các tác vụ được thực hiện, cập nhật trạng thái sang 'loaded'
    emit(SplashState.loaded);
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(NavigationPath.login);
  }
}