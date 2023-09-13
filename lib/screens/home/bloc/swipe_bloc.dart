import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/model.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';
// part 'swipe_bloc.freezed.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsers>((event, emit) => _onLoadUsers(event, emit));
    on<SwipeLeft>((event, emit) => _onSwipeLeft(event, emit));
    on<SwipeRight>((event, emit) => _onSwipeRight(event, emit));
  }

 
  void _onLoadUsers(LoadUsers event, Emitter<SwipeState> emit) {
    emit(SwipeLoaded(users: event.users));
  }

  void _onSwipeLeft(SwipeLeft event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      try {
        emit(SwipeLoaded(
          users: List.from((state as SwipeLoaded).users)..remove(event.user),
        ));
      } catch (e) {}
    }
  }

  void _onSwipeRight(SwipeRight event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      try {
        emit(SwipeLoaded(
          users: List.from((state as SwipeLoaded).users)..remove(event.user),
        ));
      } catch (e) {}
    }
  } 
 

  //   Stream<SwipeState> mapEventToState(
  //   SwipeEvent event,
  // ) async* {
  //   if (event is LoadUsersEvent) {
  //     yield* _mapLoadUsersToState(event);
  //   }
  //   if (event is SwipeLeftEvent) {
  //     yield* _mapSwipeLeftToState(event, state);
  //   }
  //   if (event is SwipeRightEvent) {
  //     yield* _mapSwipeRightToState(event, state);
  //   }
  // }

  // Stream<SwipeState> _mapLoadUsersToState(LoadUsersEvent event) async* {
  //   yield SwipeLoaded(users: event.users);
  // }

  // Stream<SwipeState> _mapSwipeLeftToState(
  //     SwipeLeftEvent event, SwipeState state) async* {
  //   if (state is SwipeLoaded) {
  //     try {
  //       yield SwipeLoaded(
  //         users: List.from(state.users)..remove(event.user),
  //       );
  //     } catch (e) {}
  //   }
  // }

  // Stream<SwipeState> _mapSwipeRightToState(
  //     SwipeRightEvent event, SwipeState state) async* {
  //   if (state is SwipeLoaded) {
  //     try {
  //       yield SwipeLoaded(
  //         users: List.from(state.users)..remove(event.user),
  //       );
  //     } catch (e) {}
  //   }
  // }
}
