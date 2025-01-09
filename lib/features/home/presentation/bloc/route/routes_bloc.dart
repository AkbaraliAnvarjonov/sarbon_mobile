import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../data/models/route/fetch_routes/fetch_routes_request.dart';
import '../../../domain/entities/routes/fetch_routes_entity.dart';
import '../../../domain/usecases/delete_route_usecase.dart';
import '../../../domain/usecases/fetch_routes_usecase.dart';

part 'routes_event.dart';

part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc({
    required this.fetchRoutesUseCase,
    required this.deleteRouteUseCase,
  }) : super(const RoutesState()) {
    on<FetchRoutesEvent>(_fetchRoutes);
    on<DeleteRouteEvent>(_deleteRoute);
    on<FetchRouteStatusChangeEvent>(_fetchRouteStatusChange);
  }

  final FetchRoutesUseCase fetchRoutesUseCase;
  final DeleteRouteUseCase deleteRouteUseCase;

  Future<void> _fetchRoutes(
    FetchRoutesEvent event,
    Emitter<RoutesState> emit,
  ) async {
    emit(state.copyWith(fetchRoutesStatus: ApiStatus.loading));
    final response = await fetchRoutesUseCase(
      FetchRoutesParams(
        request: FetchRoutesRequest(
          usersId: localSource.userId,
          withRelations: true,
        ),
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(fetchRoutesStatus: ApiStatus.error)),
      (r) {
        localSource.setBadgeNumberRoutes(r.routes.length);
        emit(
          state.copyWith(
            fetchRoutesStatus: ApiStatus.success,
            routes: r.routes,
          ),
        );
      },
    );
  }

  Future<void> _deleteRoute(
    DeleteRouteEvent event,
    Emitter<RoutesState> emit,
  ) async {
    emit(state.copyWith(deleteRouteStatus: ApiStatus.loading));
    final response = await deleteRouteUseCase(
      DeleteRouteParams(
        routeId: event.routeId,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(deleteRouteStatus: ApiStatus.error)),
      (r) {
        emit(state.copyWith(deleteRouteStatus: ApiStatus.success));
      },
    );
  }

  void _fetchRouteStatusChange(
    FetchRouteStatusChangeEvent event,
    Emitter<RoutesState> emit,
  ) {
    emit(state.copyWith(fetchRoutesStatus: ApiStatus.loading));
  }
}
