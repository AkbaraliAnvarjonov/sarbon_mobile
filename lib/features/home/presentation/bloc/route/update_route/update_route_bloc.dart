import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../router/app_routes.dart';
import '../../../../../../services/api_status.dart';
import '../../../../data/models/route/update_route/update_route_request.dart';
import '../../../../domain/entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../../../../domain/entities/routes/fetch_routes_entity.dart';
import '../../../../domain/entities/search/get_addresses_response_entity.dart';
import '../../../../domain/usecases/get_addresses_usecase.dart';
import '../../../../domain/usecases/get_vehicle_types_usecase.dart';
import '../../../../domain/usecases/update_route_usecase.dart';

part 'update_route_event.dart';

part 'update_route_state.dart';

class UpdateRouteBloc extends Bloc<UpdateRouteEvent, UpdateRouteState> {
  UpdateRouteBloc({
    required this.getAddressesUseCase,
    required this.updateRouteUseCase,
    required this.getVehicleTypesUseCase,
  }) : super(const UpdateRouteState()) {
    on<SelectInitialAddressesEvent>(_selectInitialAddress);
    on<SelectFinalAddressesEvent>(_selectFinalAddress);
    on<SelectDateEvent>(_selectDate);
    on<FetchAddressesForUpdateRouteEvent>(_getAddresses);
    on<PutRouteEvent>(_putRoute);
    on<FetchVehicleTypesEvent>(_getVehicleTypes);
    on<SelectVehicleTypesEvent>(_selectVehicleType);
  }

  final GetAddressesUseCase getAddressesUseCase;
  final UpdateRouteUseCase updateRouteUseCase;
  final GetVehicleTypesUseCase getVehicleTypesUseCase;

  Future<void> _putRoute(
    PutRouteEvent event,
    Emitter<UpdateRouteState> emit,
  ) async {
    emit(state.copyWith(updateRouteStatus: ApiStatus.loading));
    final response = await updateRouteUseCase(
      UpdateRouteParams(
        request: UpdateRouteRequest(
          data: UpdateRouteData(
            guid: event.guid,
            usersId: localSource.userId,
            addressId: state.toAddress?.addressId ?? '',
            addressId2: state.fromAddress?.addressId ?? '',
            cityId: state.toAddress?.cityId ?? '',
            cityId2: state.fromAddress?.cityId ?? '',
            capacity: num.tryParse(event.capacity) ?? 0,
            volume: num.tryParse(event.volume) ?? 0,
            date:
                state.selectedDate?.formatDateHour ?? '${state.dateTime} 00:00',
            vehicleId: state.selectedVehicleType?.guid ?? '',
            shortName: state.selectedVehicleType?.name ?? '',
          ),
        ),
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(updateRouteStatus: ApiStatus.error)),
      (r) => emit(state.copyWith(updateRouteStatus: ApiStatus.success)),
    );
  }

  Future<void> _getAddresses(
    FetchAddressesForUpdateRouteEvent event,
    Emitter<UpdateRouteState> emit,
  ) async {
    emit(state.copyWith(getAddressesStatus: ApiStatus.loading));
    final response = await getAddressesUseCase(
      const GetAddressesParams(
        limit: 10,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(getAddressesStatus: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            getAddressesStatus: ApiStatus.success,
            addresses: r.addresses,
          ),
        );
        add(const FetchVehicleTypesEvent());
      },
    );
  }

  Future<void> _getVehicleTypes(
    FetchVehicleTypesEvent event,
    Emitter<UpdateRouteState> emit,
  ) async {
    emit(state.copyWith(getAddressesStatus: ApiStatus.loading));
    final response = await getVehicleTypesUseCase(
      const GetVehicleTypesParams(
        limit: 10,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(getAddressesStatus: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            vehicleTypes: r.vehicleTypes,
            getAddressesStatus: ApiStatus.initial,
          ),
        );
      },
    );
  }

  void _selectVehicleType(
    SelectVehicleTypesEvent event,
    Emitter<UpdateRouteState> emit,
  ) =>
      emit(state.copyWith(selectedVehicleType: event.vehicleType));

  void _selectInitialAddress(
    SelectInitialAddressesEvent event,
    Emitter<UpdateRouteState> emit,
  ) =>
      emit(state.copyWith(fromAddress: event.address));

  void _selectFinalAddress(
    SelectFinalAddressesEvent event,
    Emitter<UpdateRouteState> emit,
  ) =>
      emit(state.copyWith(toAddress: event.address));

  void _selectDate(
    SelectDateEvent event,
    Emitter<UpdateRouteState> emit,
  ) =>
      emit(
        state.copyWith(
          dateTime: event.date,
          selectedDate: event.selectedDate,
        ),
      );
}
