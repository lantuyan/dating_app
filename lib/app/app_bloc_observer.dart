import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/logger/logger.dart';
import '../di/service_locator.dart';

class AppBlocObserver extends BlocObserver {
  // final _logger = ServiceLocator.inject<Logger>();
  // @override
  // void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
  //   super.onChange(bloc, change);
  //   _logger.v('onChange: ${bloc.runtimeType}, $change');
  // }

  // @override
  // void onEvent(Bloc bloc, Object? event) {
  //   super.onEvent(bloc, event);
  //   print('onEvent: ${bloc.runtimeType}, $event');
  // }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   _logger.v('onTransition: ${bloc.runtimeType}, $transition');
  // }

  // @override
  // void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
  //   _logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
  //   super.onError(bloc, error, stackTrace);
  // }

   @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}
