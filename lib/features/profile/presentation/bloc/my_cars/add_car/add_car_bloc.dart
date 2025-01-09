import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../router/app_routes.dart';
import '../../../../../../services/api_status.dart';

import '../../../../data/models/eco_standart_type.dart';
import '../../../../domain/entities/create_car_request_entity.dart';
import '../../../../domain/entities/get_cargo_types_response_entity.dart';
import '../../../../domain/entities/get_load_types_response_entity.dart';
import '../../../../domain/entities/get_trailer_types_response_entity.dart';
import '../../../../domain/usecases/check_vehicle_number_usecase.dart';
import '../../../../domain/usecases/create_car_usecase.dart';
import '../../../../domain/usecases/get_cargo_types_usecase.dart';
import '../../../../domain/usecases/get_fuel_usecase.dart';
import '../../../../domain/usecases/get_load_types_usecase.dart';
import '../../../../domain/usecases/get_trailer_types_usecase.dart';

part 'add_car_event.dart';

part 'add_car_state.dart';

class AddCarBloc extends Bloc<AddCarEvent, AddCarState> {
  AddCarBloc({
    required this.getCargoTypesUseCase,
    required this.getTrailerTypesUseCase,
    required this.getFuelTypesUseCase,
    required this.getLoadTypesUseCase,
    required this.addCarUseCase,
    required this.checkVehicleNumberUseCase,
  }) : super(const AddCarState()) {
    on<InitialEvent>(_initial);
    on<SelectCargoTypeEvent>(_selectCargoType);
    on<SelectTrailerTypeEvent>(_selectTrailerType);
    on<SelectLoadTypeEvent>(_selectLoadType);
    on<WriteLoadWeightEvent>(_writeLoadWeight);
    on<WriteLoadCapacityEvent>(_writeLoadCapacity);
    on<ChangeHydroliftStatusEvent>(_changeHydroliftStatus);
    on<ChangeKonikiStatusEvent>(_changeKonikiStatus);
    on<AddCarButtonPressedEvent>(_addCar);
    on<ChangeBodyDimensionsStatusEvent>(_bodyDimensionsStatus);
    on<SelectFuelEvent>(_selectFuelType);
    on<WriteVehicleNumberEvent>(_writeVehicleNumber);
    on<SelectVehicleImageEvent>(_selectImage);
    on<SelectTechnicalPassportFrontImageEvent>(_selectTechnicalPassportFrontImage);
    on<SelectTechnicalPassportBackImageEvent>(_selectTechnicalPassportBackImage);
    on<SelectTrailerPassportFrontImage1Event>(_selectTrailerPassportFrontImage1);
    on<SelectTrailerPassportBackImage1Event>(_selectTrailerPassportBackImage1);
    on<SelectTrailerPassportFrontImage2Event>(_selectTrailerPassportFrontImage2);
    on<SelectTrailerPassportBackImage2Event>(_selectTrailerPassportBackImage2);
    on<ChangeStatusEvent>(_changeStatus);
    on<SelectAdrFrontImageEvent>(_selectAdrFrontImage);
    on<SelectAdrBackImageEvent>(_selectAdrBackImage);
    on<ChangePage>(_changePage);
    on<ChangeCarCountryEvent>(_changeCarCountryEvent);
    on<SelectEcoTypeEvent>(_selectEcoTypeEvent);
  }

  final GetCargoTypesUseCase getCargoTypesUseCase;
  final GetTrailerTypesProfileUseCase getTrailerTypesUseCase;
  final GetFuelTypesUseCase getFuelTypesUseCase;
  final CheckVehicleNumberUseCase checkVehicleNumberUseCase;
  final GetLoadTypesUseCase getLoadTypesUseCase;
  final CreateCarUseCase addCarUseCase;

  Future<void> _initial(
    InitialEvent event,
    Emitter<AddCarState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    await Future.wait([
      _getCargoTypes(emit),
      _getTrailerTypes(emit),
      _getLoadTypes(emit),
      _getFuelTypes(emit),
    ]);
    if (!state.status.isError) {
      emit(state.copyWith(status: ApiStatus.initial));
    }
  }

  Future<void> _getCargoTypes(
    Emitter<AddCarState> emit,
  ) async {
    final response = await getCargoTypesUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) => emit(state.copyWith(cargoTypes: r.cargoTypes)),
    );
  }

  Future<void> _getTrailerTypes(
    Emitter<AddCarState> emit,
  ) async {
    final response = await getTrailerTypesUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) => emit(state.copyWith(trailerTypes: r.trailerTypes)),
    );
  }

  Future<void> _getFuelTypes(
    Emitter<AddCarState> emit,
  ) async {
    final response = await getFuelTypesUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) => emit(state.copyWith(fuelTypes: r.trailerTypes)),
    );
  }

  Future<void> _getLoadTypes(
    Emitter<AddCarState> emit,
  ) async {
    final response = await getLoadTypesUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) => emit(state.copyWith(loadTypes: r.loadTypes)),
    );
  }

  void _selectCargoType(
    SelectCargoTypeEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(state.copyWith(selectedCargoType: event.cargoType));

  void _selectEcoTypeEvent(
    SelectEcoTypeEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(state.copyWith(ecoStandartType: event.ecoType));

  void _selectTrailerType(
    SelectTrailerTypeEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(state.copyWith(selectedTrailerType: event.trailerType));

  void _selectLoadType(
    SelectLoadTypeEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(state.copyWith(selectedLoadType: event.loadType));

  void _writeLoadWeight(
    WriteLoadWeightEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(
        state.copyWith(
          loadWeight: num.tryParse(event.loadWeight.trim()) ?? 0,
        ),
      );

  void _writeLoadCapacity(
    WriteLoadCapacityEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(
        state.copyWith(
          loadCapacity: num.tryParse(event.loadCapacity.trim()) ?? 0,
        ),
      );

  Future<void> _writeVehicleNumber(
    WriteVehicleNumberEvent event,
    Emitter<AddCarState> emit,
  ) async {
    emit(
      state.copyWith(
        vehicleNumber: event.vehicleNumber,
        vehicleStatus: ApiStatus.loading,
      ),
    );
    if (event.vehicleNumber.isNotEmpty) {
      final response = await checkVehicleNumberUseCase.call(event.vehicleNumber);

      response.fold(
        (l) {},
        (isEmpty) {
          if (!isEmpty) {
            emit(state.copyWith(vehicleStatus: ApiStatus.error));
          }
        },
      );
    }
  }

  void _changeHydroliftStatus(
    ChangeHydroliftStatusEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(state.copyWith(hydrolift: !state.hydrolift));

  void _changeKonikiStatus(
    ChangeKonikiStatusEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(state.copyWith(koniki: !state.koniki));

  void _bodyDimensionsStatus(
    ChangeBodyDimensionsStatusEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(
        state.copyWith(
          bodyDimensions: !state.bodyDimensions,
        ),
      );

  void _changeCarCountryEvent(
    ChangeCarCountryEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(
        state.copyWith(countryCode: event.countryCode),
      );

  void _selectFuelType(
    SelectFuelEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(
        state.copyWith(
          selectedFuelType: event.fuel,
        ),
      );

  Future<void> _addCar(
    AddCarButtonPressedEvent event,
    Emitter<AddCarState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await addCarUseCase(
      CreateCarRequestEntity(
        userId: localSource.userId,
        cargoTypeId: state.selectedCargoType?.guid ?? '',
        ecoType: state.ecoStandartType?.value ?? '',
        capacity: state.loadCapacity,
        height: state.loadWeight,
        trailerTypeId: state.selectedTrailerType?.guid ?? '',
        loadTypeId: state.selectedLoadType?.guid ?? '',
        negotiable: state.hydrolift,
        konika: state.koniki,
        status: const ['active'],
        bodyDimensions: state.bodyDimensions,
        fuelId: state.selectedFuelType?.guid ?? '',
        carNumber: state.vehicleNumber,
        carPosition: const ['moderation'],
        vehicleImage: event.vehicleImage,
        adrPictureFront: event.adrPictureFront,
        adrPictureBack: event.adrPictureBack,
        techPassportFront: event.techPassportFront,
        techPassportBack: event.techPassportBack,
        techPassportTrailerFront1: event.techPassportTrailerFront1,
        techPassportTrailerFront2: event.techPassportTrailerFront2,
        techPassportTrailerBack1: event.techPassportTrailerBack1,
        techPassportTrailerBack2: event.techPassportTrailerBack2,
        ruNumber: event.ruNumber,
        kzNumber: event.kzNumber,
        trNumber: event.trNumber,
        countryCode: state.countryCode,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) => emit(state.copyWith(status: ApiStatus.success)),
    );
  }

  void _selectImage(
    SelectVehicleImageEvent event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        vehicleFile: event.imageFile,
      ),
    );
  }

  void _selectTechnicalPassportFrontImage(
    SelectTechnicalPassportFrontImageEvent event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        technicalPassportFileFront: event.imageFile,
      ),
    );
  }

  // Future<void> _checkVehicleNumber(
  //   CheckVehicleNumberEvent event,
  //   Emitter<AddCarState> emit,
  // ) async {
  //
  // }

  void _selectTechnicalPassportBackImage(
    SelectTechnicalPassportBackImageEvent event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        technicalPassportFileBack: event.imageFile,
      ),
    );
  }

  void _selectTrailerPassportFrontImage1(
    SelectTrailerPassportFrontImage1Event event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        trailerPassportFileFront1: event.imageFile,
      ),
    );
  }

  void _selectTrailerPassportFrontImage2(
    SelectTrailerPassportFrontImage2Event event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        trailerPassportFileFront2: event.imageFile,
      ),
    );
  }

  void _selectTrailerPassportBackImage1(
    SelectTrailerPassportBackImage1Event event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        trailerPassportFileBack1: event.imageFile,
      ),
    );
  }

  void _selectTrailerPassportBackImage2(
    SelectTrailerPassportBackImage2Event event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        trailerPassportFileBack2: event.imageFile,
      ),
    );
  }

  void _selectAdrFrontImage(
    SelectAdrFrontImageEvent event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        adrFrontFile: event.imageFile,
      ),
    );
  }

  void _selectAdrBackImage(
    SelectAdrBackImageEvent event,
    Emitter<AddCarState> emit,
  ) {
    emit(
      state.copyWith(
        adrBackFile: event.imageFile,
      ),
    );
  }

  void _changeStatus(
    ChangeStatusEvent event,
    Emitter<AddCarState> emit,
  ) =>
      emit(state.copyWith(pageStatus: event.status));

  void _changePage(ChangePage event, Emitter<AddCarState> emit) {
    emit(state.copyWith(pageNumber: event.pageNumber));
  }
}
