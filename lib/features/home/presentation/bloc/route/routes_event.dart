part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  const RoutesEvent();
}

class FetchRoutesEvent extends RoutesEvent {
  const FetchRoutesEvent();

  @override
  List<Object?> get props => [];
}

class DeleteRouteEvent extends RoutesEvent {
  const DeleteRouteEvent({required this.routeId});

  final String routeId;

  @override
  List<Object?> get props => [routeId];
}

class FetchRouteStatusChangeEvent extends RoutesEvent {
  const FetchRouteStatusChangeEvent();

  @override
  List<Object?> get props => [];
}
