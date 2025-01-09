import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../router/app_routes.dart';
import '../../../domain/entities/get_user_cars_response_entity.dart';
import '../../../domain/usecases/get_user_cars_usecase.dart';

part 'my_cars_event.dart';

part 'my_cars_state.dart';

class MyCarsBloc extends Bloc<MyCarsEvent, MyCarsState> {
  MyCarsBloc({
    required this.getUserCarsUseCase,
  }) : super(const MyCarsState()) {
    on<InitialEvent>(_initial);
    on<GetActiveCarsEvent>(_getMyCars);
    on<FetchActiveCarsPaginationEvent>(_fetchActiveCarsPagination);
    on<FetchInActiveCarsPaginationEvent>(_fetchInActiveCarsPagination);
  }

  final GetUserCarsUseCase getUserCarsUseCase;

  Future<void> _initial(
    InitialEvent event,
    Emitter<MyCarsState> emit,
  ) async {
    emit(state.copyWith(status: MyCarsStateStatus.loading));
    await Future.wait([
      _getActiveCars(emit),
      _getInactiveCars(emit),
    ]);
    if (!state.status.isError) {
      emit(state.copyWith(status: MyCarsStateStatus.success));
    }
  }

  Future<void> _getActiveCars(
    Emitter<MyCarsState> emit,
  ) async {
    final response = await getUserCarsUseCase(
      GetUserCarsParams(
        limit: state.limit,
        offset: 0,
        userId: localSource.userId,
        status: ['active'],
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: MyCarsStateStatus.error)),
      (r) {
        localSource.setVehicleId(response.right.userCars.firstOrNull?.vehicleTypeId ?? '');

        emit(
          state.copyWith(
            activeCars: r.userCars,
            activeCarsCount: r.count,
            activeCarsOffset: r.userCars.length,
          ),
        );
      },
    );
  }

  Future<void> _getInactiveCars(
    Emitter<MyCarsState> emit,
  ) async {
    final response = await getUserCarsUseCase(
      GetUserCarsParams(
        limit: state.limit,
        offset: 0,
        userId: localSource.userId,
        status: ['in_active'],
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: MyCarsStateStatus.error)),
      (r) {
        emit(
          state.copyWith(
            inActiveCars: r.userCars,
            inActiveCarsCount: r.count,
            inActiveCarsOffset: r.userCars.length,
          ),
        );
      },
    );
  }

  Future<void> _getMyCars(
    GetActiveCarsEvent event,
    Emitter<MyCarsState> emit,
  ) async {
    emit(state.copyWith(status: MyCarsStateStatus.loading));
    await _getActiveCars(emit);
    if (!state.status.isError) {
      emit(state.copyWith(status: MyCarsStateStatus.success));
    }
  }

  Future<void> _fetchActiveCarsPagination(
    FetchActiveCarsPaginationEvent event,
    Emitter<MyCarsState> emit,
  ) async {
    emit(state.copyWith(activeCarsPagination: MyCarsStateStatus.loading));
    final response = await getUserCarsUseCase(
      GetUserCarsParams(
        limit: state.limit,
        offset: state.activeCarsOffset,
        userId: localSource.userId,
        status: ['active'],
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(activeCarsPagination: MyCarsStateStatus.error)),
      (r) {
        final List<UserCarEntity> cars = [
          ...state.activeCars!,
          ...r.userCars,
        ];
        emit(
          state.copyWith(
            activeCars: cars,
            activeCarsOffset: state.activeCarsOffset + state.limit,
            activeCarsPagination: MyCarsStateStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchInActiveCarsPagination(
    FetchInActiveCarsPaginationEvent event,
    Emitter<MyCarsState> emit,
  ) async {
    emit(state.copyWith(inActiveCarsPagination: MyCarsStateStatus.loading));
    final response = await getUserCarsUseCase(
      GetUserCarsParams(
        limit: state.limit,
        offset: state.inActiveCarsOffset,
        userId: localSource.userId,
        status: ['in_active'],
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(inActiveCarsPagination: MyCarsStateStatus.error)),
      (r) {
        final List<UserCarEntity> cars = [
          ...state.inActiveCars!,
          ...r.userCars,
        ];
        emit(
          state.copyWith(
            inActiveCars: cars,
            inActiveCarsOffset: state.inActiveCarsOffset + state.limit,
            inActiveCarsPagination: MyCarsStateStatus.success,
          ),
        );
      },
    );
  }
}
