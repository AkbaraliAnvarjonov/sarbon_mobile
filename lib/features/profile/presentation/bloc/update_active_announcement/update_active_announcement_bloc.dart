import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../services/api_status.dart';
import '../../../data/models/announcement/create_announcement/create_announcement_request.dart';
import '../../../domain/entities/announcement/addresses/addresses_entity.dart';
import '../../../domain/entities/announcement/type_car/type_cars_entity.dart';
import '../../../domain/entities/announcement/type_currency/type_currency_entity.dart';
import '../../../domain/usecases/announcement/create_announcement.dart';
import '../../../domain/usecases/announcement/get_addresses_usecase.dart';
import '../../../domain/usecases/announcement/get_cars_type_usecase.dart';
import '../../../domain/usecases/announcement/get_currency_type_usecase.dart';
import '../../../domain/usecases/announcement/update_announcement.dart';

part 'update_active_announcement_event.dart';

part 'update_active_announcement_state.dart';

class UpdateActiveAnnouncementBloc
    extends Bloc<UpdateActiveAnnouncementEvent, UpdateActiveAnnouncementState> {
  UpdateActiveAnnouncementBloc({
    required this.getCarTypesUseCase,
    required this.getAddressesSaleCarUseCase,
    required this.getCurrencyTypesUseCase,
    required this.updateAnnouncementUseCase,
  }) : super(const UpdateActiveAnnouncementState()) {
    on<GetInformationUpdateActiveEvent>(_getInformation);
    on<SelectCarTypeEvent>(_setSelectedCarType);
    on<SelectImageEvent>(_selectImage);
    on<SelectAddressSaleCarEvent>(_selectAddress);
    on<SelectCurrencyEvent>(_selectCurrency);
    on<ChangeApiStatusEvent>(_changeApiAnnouncementStatus);
    on<UpdateAnnouncementStatusEvent>(_changeAnnouncementStatus);
    on<UpdateAnnouncementEvent>(_updateAnnouncement);
  }

  final GetCarTypesUseCase getCarTypesUseCase;
  final GetAddressesSaleCarUseCase getAddressesSaleCarUseCase;
  final GetCurrencyTypesUseCase getCurrencyTypesUseCase;
  final UpdateAnnouncementUseCase updateAnnouncementUseCase;

  Future<void> _updateAnnouncement(
    UpdateAnnouncementEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) async {
    emit(state.copyWith(updateAnnouncementStatus: ApiStatus.loading));
    final response =
        await updateAnnouncementUseCase(event.updateAnnouncementRequest);
    response.fold(
      (failure) {
        emit(state.copyWith(updateAnnouncementStatus: ApiStatus.error));
      },
      (success) {
        emit(state.copyWith(updateAnnouncementStatus: ApiStatus.success));
      },
    );
  }

  Future<void> _getInformation(
    GetInformationUpdateActiveEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) async {
    await _getCarTypes(emit);
    await _getAddresses(emit);
    await _getCurrencyTypes(emit);
  }

  Future<void> _getCarTypes(
    Emitter<UpdateActiveAnnouncementState> emit,
  ) async {
    emit(state.copyWith(getCarTypesStatus: ApiStatus.loading));
    final response = await getCarTypesUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(getCarTypesStatus: ApiStatus.error));
      },
      (typeCarsEntity) {
        emit(
          state.copyWith(
            typeCarsList: typeCarsEntity.typeCarsList,
            getCarTypesStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _getAddresses(
    Emitter<UpdateActiveAnnouncementState> emit,
  ) async {
    emit(state.copyWith(getAddressesStatus: ApiStatus.loading));
    final response = await getAddressesSaleCarUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(getAddressesStatus: ApiStatus.error));
      },
      (addressesEntity) {
        emit(
          state.copyWith(
            addressesList: addressesEntity.addressesList,
            getAddressesStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _getCurrencyTypes(
    Emitter<UpdateActiveAnnouncementState> emit,
  ) async {
    emit(state.copyWith(getCurrencyTypesStatus: ApiStatus.loading));
    final response = await getCurrencyTypesUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(getCurrencyTypesStatus: ApiStatus.error));
      },
      (typeCurrencyEntity) {
        emit(
          state.copyWith(
            currencyList: typeCurrencyEntity.currencyList,
            getCurrencyTypesStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  void _setSelectedCarType(
    SelectCarTypeEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        selectedCarType: event.selectedCarType,
      ),
    );
  }

  void _selectAddress(
    SelectAddressSaleCarEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        selectedAddress: event.selectedAddress,
      ),
    );
  }

  void _selectCurrency(
    SelectCurrencyEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        selectedCurrency: event.selectedCurrency,
      ),
    );
  }

  void _selectImage(
    SelectImageEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        imageFile: event.imageFile,
      ),
    );
  }

  void _changeApiAnnouncementStatus(
    ChangeApiStatusEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        updateAnnouncementStatus: ApiStatus.loading,
      ),
    );
  }

  void _changeAnnouncementStatus(
    UpdateAnnouncementStatusEvent event,
    Emitter<UpdateActiveAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        announcementStatus: event.status,
      ),
    );
  }
}
