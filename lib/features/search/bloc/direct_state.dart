part of 'direct_bloc.dart';

abstract class DirectState extends Equatable {}

final class DirectInitial extends DirectState {
  @override
  List<Object?> get props => [];
}

final class DirectLoading extends DirectState {
  @override
  List<Object?> get props => [];
}

final class DirectLoaded extends DirectState {
  final List<DirectModel> myItem;

  DirectLoaded({required this.myItem});

  @override
  List<Object?> get props => [myItem];
}

final class DirectLoadingFailure extends DirectState {
  final String error;

  DirectLoadingFailure({required this.error});
  @override
  List<Object?> get props => [error];
}
