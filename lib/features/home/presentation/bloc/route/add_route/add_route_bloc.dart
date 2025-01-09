import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../router/app_routes.dart';
import '../../../../../../services/api_status.dart';
import '../../../../data/models/route/create_route/create_route_request.dart';
import '../../../../domain/entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../../../../domain/entities/search/get_addresses_response_entity.dart';
import '../../../../domain/usecases/create_route_usecase.dart';
import '../../../../domain/usecases/get_addresses_usecase.dart';
import '../../../../domain/usecases/get_vehicle_types_usecase.dart';

part 'add_route_event.dart';

part 'add_route_state.dart';

class AddRouteBloc extends Bloc<AddRouteEvent, AddRouteState> {
  AddRouteBloc({
    required this.getAddressesUseCase,
    required this.createRouteRequestUseCase,
    required this.getVehicleTypesUseCase,
  }) : super(const AddRouteState()) {
    on<SelectInitialAddressesEvent>(_selectInitialAddress);
    on<SelectFinalAddressesEvent>(_selectFinalAddress);
    on<SelectDateEvent>(_selectDate);
    on<FetchAddressesEvent>(_getAddresses);
    on<CreateRouteEvent>(_createRoute);
    on<FetchVehicleTypesEvent>(_getVehicleTypes);
    on<SelectVehicleTypesEvent>(_selectVehicleType);
  }

  final GetAddressesUseCase getAddressesUseCase;
  final CreateRouteUseCase createRouteRequestUseCase;
  final GetVehicleTypesUseCase getVehicleTypesUseCase;

  Future<void> _createRoute(
    CreateRouteEvent event,
    Emitter<AddRouteState> emit,
  ) async {
    emit(state.copyWith(createRouteStatus: ApiStatus.loading));
    final response = await createRouteRequestUseCase(
      CreateRouteParams(
        request: CreateRouteRequest(
          data: CreateRouteData(
            usersId: localSource.userId,
            capacity: num.tryParse(event.capacity) ?? 0,
            volume: num.tryParse(event.volume) ?? 0,
            date: state.dateTime?.formatDateHour,
            vehicleId: state.selectedVehicleType?.guid ?? '',
            from: state.fromAddress?.name ?? '',
            to: state.toAddress?.name ?? '',
            shortNameFrom:
                state.fromAddress?.toponymMetadata?.address.addressComponents[SearchComponentKind.country] ?? '',
            shortNameTo: state.toAddress?.toponymMetadata?.address.addressComponents[SearchComponentKind.country] ?? '',
            latFrom: state.fromAddress?.geometry.firstOrNull?.point?.latitude ?? 0,
            lngFrom: state.fromAddress?.geometry.firstOrNull?.point?.longitude ?? 0,
            latTo: state.toAddress?.geometry.firstOrNull?.point?.latitude ?? 0,
            lngTo: state.toAddress?.geometry.firstOrNull?.point?.longitude ?? 0,
            // shortName: state.selectedVehicleType?.name ?? '',
            // addressId: state.toAddress?.addressId ?? '',
            // addressId2: state.fromAddress?.addressId?? '',
            // cityId: state.toAddress?.guid ?? '',
            // cityId2: state.fromAddress?.guid ?? '',
          ),
        ),
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(createRouteStatus: ApiStatus.error)),
      (r) {
        emit(state.copyWith(createRouteStatus: ApiStatus.success));
      },
    );
  }

  Future<void> _getAddresses(
    FetchAddressesEvent event,
    Emitter<AddRouteState> emit,
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
    Emitter<AddRouteState> emit,
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
    Emitter<AddRouteState> emit,
  ) =>
      emit(state.copyWith(selectedVehicleType: event.vehicleType));

  void _selectInitialAddress(
    SelectInitialAddressesEvent event,
    Emitter<AddRouteState> emit,
  ) =>
      emit(state.copyWith(fromAddress: event.address));

  void _selectFinalAddress(
    SelectFinalAddressesEvent event,
    Emitter<AddRouteState> emit,
  ) =>
      emit(state.copyWith(toAddress: event.address));

  void _selectDate(
    SelectDateEvent event,
    Emitter<AddRouteState> emit,
  ) =>
      emit(state.copyWith(dateTime: event.date));
}
