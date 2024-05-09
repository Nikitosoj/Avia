part of 'ticket_bloc.dart';

abstract class TicketState extends Equatable {}

final class TicketInitial extends TicketState {
  @override
  List<Object?> get props => [];
}

final class TicketLoading extends TicketState {
  @override
  List<Object?> get props => [];
}

final class TicketLoaded extends TicketState {
  final List<TicketModel> myItem;

  TicketLoaded({required this.myItem});
  @override
  List<Object?> get props => [];
}

final class TicketLoadingFailure extends TicketState {
  final String error;

  TicketLoadingFailure({required this.error});

  @override
  List<Object?> get props => [];
}
