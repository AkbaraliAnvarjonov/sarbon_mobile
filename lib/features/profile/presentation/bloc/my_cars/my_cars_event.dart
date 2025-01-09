part of 'my_cars_bloc.dart';

abstract class MyCarsEvent extends Equatable {
  const MyCarsEvent();
}

class InitialEvent extends MyCarsEvent {
  const InitialEvent();

  @override
  List<Object?> get props => [];
}

class FetchActiveCarsPaginationEvent extends MyCarsEvent {
  const FetchActiveCarsPaginationEvent();

  @override
  List<Object?> get props => [];
}

class FetchInActiveCarsPaginationEvent extends MyCarsEvent {
  const FetchInActiveCarsPaginationEvent();

  @override
  List<Object?> get props => [];
}

class GetActiveCarsEvent extends MyCarsEvent {
  const GetActiveCarsEvent();

  @override
  List<Object?> get props => [];
}
