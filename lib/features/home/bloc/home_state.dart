part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoaded extends HomeState {
  final MusicFlyModelList myItem;

  HomeLoaded({required this.myItem});

  @override
  List<Object?> get props => [
        myItem,
      ];
}

final class HomeLoadingFailure extends HomeState {
  final String error;

  HomeLoadingFailure({required this.error});
  @override
  List<Object?> get props => [error];
}
