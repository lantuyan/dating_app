import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'common/error_screen.dart';
import 'common/logger/logger.dart';
import 'di/service_locator.dart';

const String authDioInstance = 'auth_dio';
const String noAuthDioInstance = 'no_auth_dio';

Future<void> bootstrap() async {
  final logger = ServiceLocator.inject<Logger>();
  FlutterError.onError = (FlutterErrorDetails details) {
    logger(details.exceptionAsString(), stackTrace: details.stack);
  };

  EquatableConfig.stringify = true;
  Bloc.observer = AppBlocObserver();

  ErrorWidget.builder = (details) => ErrorScreen(details: details);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationSupportDirectory(),
  );

  runZonedGuarded(
    () => runApp(const App()),
    (Object error, StackTrace stackTrace) {
      logger(error.toString(), stackTrace: stackTrace);
    },
  );
}
