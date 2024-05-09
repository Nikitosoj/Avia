import 'dart:async';

import 'package:avia/features/tickets/domain/ticket_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/api/home_api.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketInitial()) {
    on<LoadTicket>(fetch);
  }

  Future<void> fetch(LoadTicket event, Emitter<TicketState> emit) async {
    try {
      if (state is! TicketLoaded) {
        emit(TicketLoading());
      }
      final myItem = await fetchTickets(
              'https://run.mocky.io/v3/2dbc0999-86bf-4c08-8671-bac4b7a5f7eb')
          .timeout(const Duration(seconds: 5));
      emit(TicketLoaded(myItem: myItem));
    } on TimeoutException {
      emit(TicketLoadingFailure(error: 'Timeout Error'));
    } catch (e) {
      emit(TicketLoadingFailure(error: e.toString()));
      rethrow;
    }
  }
}
