part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {}

final class LoadTicket extends TicketEvent {
  @override
  List<Object?> get props => [];
}
