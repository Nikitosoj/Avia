import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/api/home_api.dart';
import '../domain/direct_model.dart';

part 'direct_event.dart';
part 'direct_state.dart';

class DirectBloc extends Bloc<DirectEvent, DirectState> {
  DirectBloc() : super(DirectInitial()) {
    on<LoadDirect>(fetch);
  }

  Future<void> fetch(LoadDirect event, Emitter<DirectState> emit) async {
    try {
      if (state is! DirectLoaded) {
        emit(DirectLoading());
      }
      final myItem = await fetchDirect(
              'https://run.mocky.io/v3/3424132d-a51a-4613-b6c9-42b2d214f35f')
          .timeout(const Duration(seconds: 5));
      emit(DirectLoaded(myItem: myItem));
    } on TimeoutException {
      emit(DirectLoadingFailure(error: 'Timeout Error'));
    } catch (e) {
      emit(DirectLoadingFailure(error: e.toString()));
      rethrow;
    }
  }
}
