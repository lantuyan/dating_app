import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/example_repository.dart';
import '../../../models/dtos/city.dart';

class HomeCubit extends Cubit<List<City>> {
  HomeCubit(this.repository) : super(/* initial state ==> */ []);

  final ExampleRepository repository;

  /// Functions contain async logics should return [Future] type
  Future<void> _fetchTexts() async {
    final citiesEither = await repository.getCities();
    citiesEither.fold(
      ifLeft: (_) => emit([]),
      ifRight: (cities) => emit(cities),
    );
  }

  /// Cubit or Bloc should expose normal functions (functions not return a [Future])
  /// to UI layer
  /// Consider use [unawaited] function for calling functions that return [Future]
  /// Not all futures need to be awaited
  void displaySomeText() => unawaited(_fetchTexts());
}
