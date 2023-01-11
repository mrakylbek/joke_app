// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import '../data/model/joke_model.dart';
import '../data/repositories/joke_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// import '../data/model/joke_model.dart';
// import '../data/repositories/joke_repository.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokeLoadingState());

      try {
        final joke = await _jokeRepository.getJoke();
        emit(JokeLoadedState(joke));
      } catch (e) {
        emit(JokeErrorState(e.toString()));
      }
    });
  }
}
