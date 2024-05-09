import 'dart:async';

import 'package:avia/core/api/home_api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/music_fly_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHome>(fetch);
  }

  Future<void> fetch(LoadHome event, Emitter<HomeState> emit) async {
    try {
      if (state is! HomeLoaded) {
        emit(HomeLoading());
      }

      final myItem = await fetchMusic(
              'https://run.mocky.io/v3/00727197-24ae-48a0-bcb3-63eb35d7a9de')
          .timeout(const Duration(seconds: 5));

      emit(HomeLoaded(
        myItem: myItem,
      ));
    } on TimeoutException {
      emit(HomeLoadingFailure(error: 'Timeout Error'));
    } catch (e) {
      emit(HomeLoadingFailure(error: e.toString()));
      rethrow;
    }
  }
}
