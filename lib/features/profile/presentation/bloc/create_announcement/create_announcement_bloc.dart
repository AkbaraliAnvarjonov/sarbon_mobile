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

part 'create_announcement_event.dart';

part 'create_announcement_state.dart';

class CreateAnnouncementBloc
    extends Bloc<AnnouncementEvent, CreateAnnouncementState> {
  CreateAnnouncementBloc({
    required this.getCarTypesUseCase,
    required this.getAddressesSaleCarUseCase,
    required this.getCurrencyTypesUseCase,
    required this.createAnnouncementUseCase,
  }) : super(const CreateAnnouncementState()) {
    on<GetInformationEvent>(_getInformation);
    on<SelectCarTypeEvent>(_setSelectedCarType);
    on<SelectImageEvent>(_selectImage);
    on<SelectAddressSaleCarEvent>(_selectAddress);
    on<SelectCurrencyEvent>(_selectCurrency);
    on<CreateAnnouncementEvent>(_createAnnouncement);
    on<ChangeStatusEvent>(_changeAnnouncementStatus);
  }

  final GetCarTypesUseCase getCarTypesUseCase;
  final GetAddressesSaleCarUseCase getAddressesSaleCarUseCase;
  final GetCurrencyTypesUseCase getCurrencyTypesUseCase;
  final CreateAnnouncementUseCase createAnnouncementUseCase;

  Future<void> _getInformation(
    GetInformationEvent event,
    Emitter<CreateAnnouncementState> emit,
  ) async {
    await _getCarTypes(emit);
    await _getAddresses(emit);
    await _getCurrencyTypes(emit);
  }

  Future<void> _getCarTypes(
      Emitter<CreateAnnouncementState> emit,
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
      Emitter<CreateAnnouncementState> emit,
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
      Emitter<CreateAnnouncementState> emit,
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

  Future<void> _createAnnouncement(
    CreateAnnouncementEvent event,
    Emitter<CreateAnnouncementState> emit,
  ) async {
    emit(state.copyWith(createAnnouncementStatus: ApiStatus.loading));
    final response =
        await createAnnouncementUseCase(event.createAnnouncementRequest);
    response.fold(
      (failure) {
        emit(state.copyWith(createAnnouncementStatus: ApiStatus.error));
      },
      (success) {
        emit(state.copyWith(createAnnouncementStatus: ApiStatus.success));
      },
    );
  }

  void _setSelectedCarType(
    SelectCarTypeEvent event,
    Emitter<CreateAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        selectedCarType: event.selectedCarType,
      ),
    );
  }

  void _selectAddress(
    SelectAddressSaleCarEvent event,
    Emitter<CreateAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        selectedAddress: event.selectedAddress,
      ),
    );
  }

  void _selectCurrency(
    SelectCurrencyEvent event,
    Emitter<CreateAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        selectedCurrency: event.selectedCurrency,
      ),
    );
  }

  void _selectImage(
    SelectImageEvent event,
    Emitter<CreateAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        imageFile: event.imageFile,
      ),
    );
  }

  void _changeAnnouncementStatus(
    ChangeStatusEvent event,
    Emitter<CreateAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        createAnnouncementStatus: ApiStatus.loading,
      ),
    );
  }
}
