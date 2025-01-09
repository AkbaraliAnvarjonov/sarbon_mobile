part of 'routes_bloc.dart';

class RoutesState extends Equatable {
  const RoutesState({
    this.fetchRoutesStatus = ApiStatus.initial,
    this.deleteRouteStatus = ApiStatus.initial,
    this.routes = const [],
  });

  final ApiStatus fetchRoutesStatus;
  final ApiStatus deleteRouteStatus;
  final List<RouteEntity> routes;

  RoutesState copyWith({
    ApiStatus? fetchRoutesStatus,
    ApiStatus? deleteRouteStatus,
    List<RouteEntity>? routes,
  }) =>
      RoutesState(
        fetchRoutesStatus: fetchRoutesStatus ?? ApiStatus.initial,
        deleteRouteStatus: deleteRouteStatus ?? ApiStatus.initial,
        routes: routes ?? this.routes,
      );

  @override
  List<Object?> get props => [
        fetchRoutesStatus,
        deleteRouteStatus,
        routes,
      ];
}
