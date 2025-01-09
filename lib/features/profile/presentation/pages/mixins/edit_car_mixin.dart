part of '../my_cars/edit_car/edit_car_page.dart';

mixin EditCarMixin on State<EditCarPage> {
  late TextEditingController loadWeightController;
  late TextEditingController loadCapacityController;
  late TextEditingController vehicleNumberController;
  late EditCarBloc editCarBloc;

  void initControllers() {
    editCarBloc = context.read<EditCarBloc>();
    loadWeightController = TextEditingController();
    loadCapacityController = TextEditingController();
    vehicleNumberController = TextEditingController();
  }

  void disposeControllers() {
    loadWeightController.dispose();
    loadCapacityController.dispose();
    vehicleNumberController.dispose();
  }

  void fetchItems() {
    editCarBloc
      ..add(const FetchCargoTypesEvent())
      ..add(const FetchTrailerTypesEvent())
      ..add(const FetchLoadTypesEvent());
  }

  void initializeData() {
    editCarBloc
      ..add(
        SelectCargoTypeEvent(widget.arguments.selectedCargoType),
      )
      ..add(
        SelectTrailerTypeEvent(widget.arguments.selectedTrailerType),
      )
      ..add(
        SelectLoadTypeEvent(widget.arguments.selectedLoadType),
      )
      ..add(
        ChangeHydroLiftStatusEvent(value: widget.arguments.hydraLift),
      )
      ..add(
        ChangeKonikyStatusEvent(value: widget.arguments.koniky),
      )
      ..add(
        ChangeBodyDimensionsStatusEvent(value: widget.arguments.bodyDimensions),
      )
      ..add(
        ChangeActiveInActiveStatusEvent(carStatus: widget.arguments.status),
      );
    loadCapacityController.text = widget.arguments.capacity;
    loadWeightController.text = widget.arguments.volume;
    vehicleNumberController.text = widget.arguments.vehicleNumber;
  }

  CreateUpdateCarRequestModel updatedFields({
    required EditCarState state,
    required String vehicleImage,
    required String techPassportFront,
    required String techPassportBack,
    required String techPassportTrailerFront1,
    required String techPassportTrailerBack1,
    required String techPassportTrailerFront2,
    required String techPassportTrailerBack2,
    required String adrPictureFront,
    required String adrPictureBack,
  }) =>
      CreateUpdateCarRequestModel(
        data: CreateUpdateCarRequestData(
          status: state.carStatus == widget.arguments.status ? null : [state.carStatus],
          trailerTypeId: state.selectedTrailerType?.guid == widget.arguments.selectedTrailerType.guid
              ? null
              : state.selectedTrailerType?.guid,
          loadTypeId: state.selectedLoadType?.guid == widget.arguments.selectedLoadType.guid
              ? null
              : state.selectedLoadType?.guid,
          capacity: loadCapacityController.text == widget.arguments.capacity
              ? null
              : num.tryParse(loadCapacityController.text),
          height: loadWeightController.text == widget.arguments.volume ? null : num.tryParse(loadWeightController.text),
          negotiable: state.hydroLift == widget.arguments.hydraLift ? null : state.hydroLift,
          konika: state.koniky == widget.arguments.koniky ? null : state.koniky,
          userId: localSource.userId,
          cargoTypeId: state.selectedCargoType?.guid == widget.arguments.selectedCargoType.guid
              ? null
              : state.selectedCargoType?.guid,
          guid: widget.arguments.carGuid,
          bodyDimensions: state.bodyDimensions == widget.arguments.bodyDimensions ? null : state.bodyDimensions,
          carNumber:
              vehicleNumberController.text == widget.arguments.vehicleNumber ? null : vehicleNumberController.text,
          vehicleImage: state.vehicleFile != null ? vehicleImage : null,
          techPassportFront: state.technicalPassportFileFront != null ? techPassportFront : null,
          techPassportBack: state.technicalPassportFileBack != null ? techPassportBack : null,
          techPassportTrailerFront1: state.trailerPassportFileFront1 != null ? techPassportTrailerFront1 : null,
          techPassportTrailerFront2: state.trailerPassportFileFront2 != null ? techPassportTrailerFront2 : null,
          techPassportTrailerBack1: state.trailerPassportFileBack1 != null ? techPassportTrailerBack1 : null,
          techPassportTrailerBack2: state.trailerPassportFileBack2 != null ? techPassportTrailerBack2 : null,
          adrPictureFront: state.adrFrontFile != null ? adrPictureFront : null,
          adrPictureBack: state.adrBackFile != null ? adrPictureBack : null,
        ),
      );

  @override
  void initState() {
    initControllers();
    fetchItems();
    initializeData();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
