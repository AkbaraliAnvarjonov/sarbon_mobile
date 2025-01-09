part of '../my_cars/add_car/add_car_page.dart';

mixin AddCarMixin on State<AddCarPage> {
  late TextEditingController loadWeightController;
  late TextEditingController loadCapacityController;
  late TextEditingController vehicleNumberController;
  late TextEditingController vehicleCountryController;
  late TextEditingController rusNumberController;
  late TextEditingController kzNumberController;
  late TextEditingController turkNumberController;
  late final PageController pageController;
  late final AddCarBloc addCarBloc;
  late final DeBouncer deBounce;
  Map<File, String> imageFiles = {};

  @override
  void initState() {
    context.read<AddCarBloc>().add(const InitialEvent());
    initControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void initControllers() {
    loadWeightController = TextEditingController();
    loadCapacityController = TextEditingController();
    turkNumberController = TextEditingController();
    vehicleNumberController = TextEditingController();
    vehicleCountryController = TextEditingController();
    rusNumberController = TextEditingController();
    kzNumberController = TextEditingController();
    pageController = PageController();
    deBounce = DeBouncer(milliseconds: 150);
    addCarBloc = context.read<AddCarBloc>();
  }

  void disposeControllers() {
    loadWeightController.dispose();
    kzNumberController.dispose();
    turkNumberController.dispose();
    rusNumberController.dispose();
    loadCapacityController.dispose();
    vehicleNumberController.dispose();
    pageController.dispose();
  }

  bool isButtonEnabled() {
    if (pageController.page == 0) {
      return loadWeightController.text.isNotEmpty &&
          loadCapacityController.text.isNotEmpty &&
          vehicleNumberController.text.isNotEmpty &&
          addCarBloc.state.countryCode.isNotEmpty &&
          addCarBloc.state.selectedTrailerType != null &&
          addCarBloc.state.selectedFuelType != null &&
          addCarBloc.state.ecoStandartType != null &&
          addCarBloc.state.selectedLoadType != null;
    } else if (pageController.page == 1) {
      return addCarBloc.state.vehicleFile != null &&
          addCarBloc.state.technicalPassportFileFront != null &&
          addCarBloc.state.technicalPassportFileBack != null;
    } else if (pageController.page == 2) {
      return addCarBloc.state.trailerPassportFileFront1 != null && addCarBloc.state.trailerPassportFileBack1 != null;
    } else if (pageController.page == 3) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> toNextPage() async {
    if (pageController.page! == 3) {
      addCarBloc.add(const ChangeStatusEvent(ApiStatus.loading));

      final allFiles = [
        addCarBloc.state.adrFrontFile,
        addCarBloc.state.adrBackFile,
      ];
      final images = await uploadMultipleFiles(allFiles);
      imageFiles.addAll(images);

      if (!mounted) return;
      context.read<AddCarBloc>().add(
            AddCarButtonPressedEvent(
              vehicleImage: imageFiles[addCarBloc.state.vehicleFile] ?? '',
              techPassportFront: imageFiles[addCarBloc.state.technicalPassportFileFront] ?? '',
              techPassportBack: imageFiles[addCarBloc.state.technicalPassportFileBack] ?? '',
              techPassportTrailerFront1: imageFiles[addCarBloc.state.trailerPassportFileFront1] ?? '',
              techPassportTrailerBack1: imageFiles[addCarBloc.state.trailerPassportFileBack1] ?? '',
              techPassportTrailerFront2: imageFiles[addCarBloc.state.trailerPassportFileFront2] ?? '',
              techPassportTrailerBack2: imageFiles[addCarBloc.state.trailerPassportFileBack2] ?? '',
              adrPictureFront: imageFiles[addCarBloc.state.adrFrontFile] ?? '',
              adrPictureBack: imageFiles[addCarBloc.state.adrBackFile] ?? '',
              ruNumber:
                  rusNumberController.text.isNotEmpty ? '+7${rusNumberController.text.replaceAll(' ', '')}' : null,
              kzNumber: kzNumberController.text.isNotEmpty ? '+7${kzNumberController.text.replaceAll(' ', '')}' : null,
              trNumber:
                  turkNumberController.text.isNotEmpty ? '+90${turkNumberController.text.replaceAll(' ', '')}' : null,
            ),
          );
    } else {
      addCarBloc.add(ChangePage(pageNumber: (pageController.page! + 1).toInt()));
      addCarBloc.add(const ChangeStatusEvent(ApiStatus.loading));
      if (pageController.page! == 1) {
        final allFiles = [
          addCarBloc.state.vehicleFile,
          addCarBloc.state.technicalPassportFileFront,
          addCarBloc.state.technicalPassportFileBack,
        ];
        final images = await uploadMultipleFiles(allFiles);
        imageFiles.addAll(images);
      } else if (pageController.page! == 2) {
        final allFiles = [
          addCarBloc.state.trailerPassportFileFront1,
          addCarBloc.state.trailerPassportFileBack1,
          addCarBloc.state.trailerPassportFileFront2,
          addCarBloc.state.trailerPassportFileBack2,
        ];
        final images = await uploadMultipleFiles(allFiles);
        imageFiles.addAll(images);
      }
      addCarBloc.add(const ChangeStatusEvent(ApiStatus.success));
      await pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}
