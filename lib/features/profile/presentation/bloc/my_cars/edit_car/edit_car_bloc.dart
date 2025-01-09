import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../services/api_status.dart';
import '../../../../data/models/create_car_request_model.dart';
import '../../../../domain/entities/get_cargo_types_response_entity.dart';
import '../../../../domain/entities/get_load_types_response_entity.dart';
import '../../../../domain/entities/get_trailer_types_response_entity.dart';
import '../../../../domain/usecases/delete_car_uscase.dart';
import '../../../../domain/usecases/get_cargo_types_usecase.dart';
import '../../../../domain/usecases/get_load_types_usecase.dart';
import '../../../../domain/usecases/get_trailer_types_usecase.dart';
import '../../../../domain/usecases/update_car_usecase.dart';

part 'edit_car_event.dart';

part 'edit_car_state.dart';

class EditCarBloc extends Bloc<EditCarEvent, EditCarState> {
  EditCarBloc({
    required this.getCargoTypesUseCase,
    required this.getTrailerTypesUseCase,
    required this.getLoadTypesUseCase,
    required this.updateCarUseCase,
    required this.deleteCarUseCase,
  }) : super(const EditCarState()) {
    on<FetchCargoTypesEvent>(_fetchCargoTypes);
    on<FetchTrailerTypesEvent>(_fetchTrailerTypes);
    on<FetchLoadTypesEvent>(_fetchLoadTypes);
    on<SelectCargoTypeEvent>(_selectCargoType);
    on<SelectTrailerTypeEvent>(_selectTrailerType);
    on<SelectLoadTypeEvent>(_selectLoadType);
    on<ChangeHydroLiftStatusEvent>(_changeHydroLiftStatus);
    on<ChangeKonikyStatusEvent>(_changeKonikyStatus);
    on<ChangeBodyDimensionsStatusEvent>(_bodyDimensionsStatus);
    on<ChangeActiveInActiveStatusEvent>(_changeCarStatus);
    on<UpdateCarEvent>(_updateCar);
    on<DeleteCarEvent>(_deleteCar);
    on<ChangeStatusEvent>(_changeStatus);
    on<SelectVehicleImageEvent>(_selectVehicleImage);
    on<SelectTechnicalPassportFrontImageEvent>(_selectTechnicalPassportFrontImage);
    on<SelectTechnicalPassportBackImageEvent>(_selectTechnicalPassportBackImage);
    on<SelectTrailerPassportFrontImage1Event>(_selectTrailerFrontImage1);
    on<SelectTrailerPassportFrontImage2Event>(_selectTrailerFrontImage2);
    on<SelectTrailerPassportBackImage1Event>(_selectTrailerBackImage1);
    on<SelectTrailerPassportBackImage2Event>(_selectTrailerBackImage2);

    on<SelectAdrFrontImageEvent>(_selectAdrFrontImage);
    on<SelectAdrBackImageEvent>(_selectAdrBackImage);
  }

  final GetCargoTypesUseCase getCargoTypesUseCase;
  final GetTrailerTypesProfileUseCase getTrailerTypesUseCase;
  final GetLoadTypesUseCase getLoadTypesUseCase;
  final UpdateCarUseCase updateCarUseCase;
  final DeleteCarUseCase deleteCarUseCase;

  Future<void> _updateCar(
    UpdateCarEvent event,
    Emitter<EditCarState> emit,
  ) async {
    emit(state.copyWith(updateCarStatus: ApiStatus.loading));
    final response = await updateCarUseCase(event.request);

    response.fold(
      (failure) {
        emit(state.copyWith(updateCarStatus: ApiStatus.error));
      },
      (success) {
        emit(state.copyWith(updateCarStatus: ApiStatus.success));
      },
    );
  }

  Future<void> _deleteCar(
    DeleteCarEvent event,
    Emitter<EditCarState> emit,
  ) async {
    emit(state.copyWith(updateCarStatus: ApiStatus.loading));
    final response = await deleteCarUseCase(event.carId);

    response.fold(
      (failure) {
        emit(state.copyWith(updateCarStatus: ApiStatus.error));
      },
      (success) {
        emit(state.copyWith(updateCarStatus: ApiStatus.success));
      },
    );
  }

  Future<void> _fetchCargoTypes(
    FetchCargoTypesEvent event,
    Emitter<EditCarState> emit,
  ) async {
    emit(state.copyWith(fetchCargoTypesStatus: ApiStatus.loading));
    final response = await getCargoTypesUseCase(NoParams());

    response.fold(
      (failure) {
        emit(state.copyWith(fetchCargoTypesStatus: ApiStatus.error));
      },
      (cargoTypes) {
        emit(
          state.copyWith(
            fetchCargoTypesStatus: ApiStatus.success,
            cargoTypes: cargoTypes.cargoTypes,
          ),
        );
      },
    );
  }

  Future<void> _fetchTrailerTypes(
    FetchTrailerTypesEvent event,
    Emitter<EditCarState> emit,
  ) async {
    emit(state.copyWith(fetchTrailerTypesStatus: ApiStatus.loading));
    final response = await getTrailerTypesUseCase(NoParams());

    response.fold(
      (failure) {
        emit(state.copyWith(fetchTrailerTypesStatus: ApiStatus.error));
      },
      (trailerTypes) {
        emit(
          state.copyWith(
            fetchTrailerTypesStatus: ApiStatus.success,
            trailerTypes: trailerTypes.trailerTypes,
          ),
        );
      },
    );
  }

  Future<void> _fetchLoadTypes(
    FetchLoadTypesEvent event,
    Emitter<EditCarState> emit,
  ) async {
    emit(state.copyWith(fetchLoadTypesStatus: ApiStatus.loading));
    final response = await getLoadTypesUseCase(NoParams());

    response.fold(
      (failure) {
        emit(state.copyWith(fetchLoadTypesStatus: ApiStatus.error));
      },
      (loadTypes) {
        emit(
          state.copyWith(
            fetchLoadTypesStatus: ApiStatus.success,
            loadTypes: loadTypes.loadTypes,
          ),
        );
      },
    );
  }

  void _selectCargoType(
    SelectCargoTypeEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(state.copyWith(selectedCargoType: event.cargoType));

  void _selectTrailerType(
    SelectTrailerTypeEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(state.copyWith(selectedTrailerType: event.trailerType));

  void _selectLoadType(
    SelectLoadTypeEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(state.copyWith(selectedLoadType: event.loadType));

  void _changeHydroLiftStatus(
    ChangeHydroLiftStatusEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          hydroLift: event.value != null ? event.value! : !state.hydroLift,
        ),
      );

  void _changeKonikyStatus(
    ChangeKonikyStatusEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          koniky: event.value != null ? event.value! : !state.koniky,
        ),
      );

  void _bodyDimensionsStatus(
    ChangeBodyDimensionsStatusEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          bodyDimensions: event.value != null ? event.value! : !state.bodyDimensions,
        ),
      );

  void _selectVehicleImage(
    SelectVehicleImageEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          vehicleFile: event.imageFile,
        ),
      );

  void _selectTechnicalPassportFrontImage(
    SelectTechnicalPassportFrontImageEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          technicalPassportFileFront: event.imageFile,
        ),
      );

  void _selectTechnicalPassportBackImage(
    SelectTechnicalPassportBackImageEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          technicalPassportFileBack: event.imageFile,
        ),
      );

  void _selectAdrFrontImage(
    SelectAdrFrontImageEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          adrFrontFile: event.imageFile,
        ),
      );

  void _selectAdrBackImage(
    SelectAdrBackImageEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          adrBackFile: event.imageFile,
        ),
      );

  void _selectTrailerFrontImage1(
    SelectTrailerPassportFrontImage1Event event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          trailerPassportFileFront1: event.imageFile,
        ),
      );

  void _selectTrailerBackImage1(
    SelectTrailerPassportBackImage1Event event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          trailerPassportFileBack1: event.imageFile,
        ),
      );

  void _selectTrailerFrontImage2(
    SelectTrailerPassportFrontImage2Event event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          trailerPassportFileFront2: event.imageFile,
        ),
      );

  void _selectTrailerBackImage2(
    SelectTrailerPassportBackImage2Event event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          trailerPassportFileBack2: event.imageFile,
        ),
      );

  void _changeCarStatus(
    ChangeActiveInActiveStatusEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          carStatus: event.carStatus,
        ),
      );

  void _changeStatus(
    ChangeStatusEvent event,
    Emitter<EditCarState> emit,
  ) =>
      emit(
        state.copyWith(
          updateCarStatus: ApiStatus.loading,
        ),
      );
}
