import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/isolate/upload_multiple_files.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../router/app_routes.dart';
import '../../../../data/models/create_car_request_model.dart';
import '../../../../domain/entities/get_cargo_types_response_entity.dart';
import '../../../../domain/entities/get_load_types_response_entity.dart';
import '../../../../domain/entities/get_trailer_types_response_entity.dart';
import '../../../bloc/my_cars/edit_car/edit_car_bloc.dart';
import '../../pages_arguments/edit_page_args.dart';
import '../add_car/widgets/add_car_item_widget.dart';
import 'widgets/delete_car_deialog.dart';

part '../../mixins/edit_car_mixin.dart';

part 'widgets/select_item_widgets.dart';

part 'widgets/status_car.dart';

part 'widgets/technical_passport_photo_widget.dart';

part 'widgets/add_car_photo_widget.dart';

part 'widgets/adr_front_photo_widget.dart';

part 'widgets/add_trailer_1_photo_widget.dart';

part 'widgets/add_trailer_photo_2_widget.dart';

class EditCarPage extends StatefulWidget {
  const EditCarPage({super.key, required this.arguments});

  final EditCarPageArguments arguments;

  @override
  State<EditCarPage> createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> with EditCarMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('editing'.tr()),
        ),
        body: BlocListener<EditCarBloc, EditCarState>(
          listenWhen: (previous, current) => previous.updateCarStatus != current.updateCarStatus,
          listener: (context, state) {
            if (state.updateCarStatus.isSuccess) {
              context.pop(true);
            }
          },
          child: BlocBuilder<EditCarBloc, EditCarState>(
            builder: (context, state) => ModalProgressHUD(
              inAsyncCall: state.fetchCargoTypesStatus.isLoading ||
                  state.fetchTrailerTypesStatus.isLoading ||
                  state.fetchLoadTypesStatus.isLoading ||
                  state.updateCarStatus.isLoading,
              child: CustomScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  SliverSafeArea(
                    minimum: AppUtils.kPaddingAll16,
                    sliver: SliverMainAxisGroup(
                      slivers: [
                        SliverList.list(
                          children: [
                            Text(
                              'total_information'.tr(),
                              style: context.textStyle.regularHeadline,
                            ),
                            AppUtils.kGap24,
                            Column(
                              children: [
                                // const _DropDownCargoWidget(),
                                CustomTextField(
                                  controller: loadCapacityController,
                                  labelText: 'load_capacity'.tr(),
                                  onChanged: (value) {},
                                  textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                                  textInputType: TextInputType.number,
                                  hintText: 'write_weight_of_cargo'.tr(),
                                ),
                                AppUtils.kGap12,
                                CustomTextField(
                                  controller: loadWeightController,
                                  labelText: 'volume_m³'.tr(),
                                  onChanged: (value) {},
                                  textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                                  textInputType: TextInputType.number,
                                  hintText: 'write_volume_cargo'.tr(),
                                ),
                                AppUtils.kGap12,
                                CustomTextField(
                                  controller: vehicleNumberController,
                                  labelText: 'number_vehicle'.tr(),
                                  onChanged: (value) {},
                                  hintText: 'write_car_number'.tr(),
                                ),
                                AppUtils.kGap12,
                                const _DropDownTrailerWidget(),
                                AppUtils.kGap12,
                                const _DropDownLoadWidget(),
                                AppUtils.kGap12,
                                _AddCarPhotoWidget(vehicleImage: widget.arguments.vehicleFile),
                                AppUtils.kGap12,
                                _TechnicalPassportPhotoWidget(
                                  technicalPassportFrontImage: widget.arguments.techPassportFront,
                                  technicalPassportBackImage: widget.arguments.techPassportBack,
                                ),
                                AppUtils.kGap12,
                                _TrailerPhoto1Widget(
                                  trailerPassportImageFront: widget.arguments.techPassportTrailerFront1,
                                  trailerPassportImageBack: widget.arguments.techPassportTrailerBack1,
                                ),
                                AppUtils.kGap12,
                                _TrailerPhoto2Widget(
                                  trailerPassportImageFront: widget.arguments.techPassportTrailerFront2,
                                  trailerPassportImageBack: widget.arguments.techPassportTrailerBack2,
                                ),

                                AppUtils.kGap12,
                                _AdrPhotoWidget(
                                  adrFrontPhoto: widget.arguments.adrFrontFile,
                                  adrBackPhoto: widget.arguments.adrBackFile,
                                ),
                                AppUtils.kGap12,
                                AddUpdateCarItemWidget(
                                  onTap: () {
                                    editCarBloc.add(
                                      const ChangeHydroLiftStatusEvent(),
                                    );
                                  },
                                  title: 'hydro_lift'.tr(),
                                  value: state.hydroLift,
                                ),
                                AppUtils.kGap12,
                                AddUpdateCarItemWidget(
                                  onTap: () {
                                    editCarBloc.add(
                                      const ChangeKonikyStatusEvent(),
                                    );
                                  },
                                  title: 'koniky'.tr(),
                                  value: state.koniky,
                                ),
                                AppUtils.kGap12,
                                AddUpdateCarItemWidget(
                                  onTap: () {
                                    editCarBloc.add(
                                      const ChangeBodyDimensionsStatusEvent(),
                                    );
                                  },
                                  title: 'internal_body_dimensions'.tr(),
                                  value: state.bodyDimensions,
                                ),
                              ],
                            ),
                            AppUtils.kGap12,
                            const _CarStatus(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: ColoredBox(
            color: context.colorScheme.surface,
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: BlocBuilder<EditCarBloc, EditCarState>(
                builder: (context, state) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: state.fetchCargoTypesStatus.isLoading ||
                              state.fetchTrailerTypesStatus.isLoading ||
                              state.fetchLoadTypesStatus.isLoading ||
                              state.updateCarStatus.isLoading
                          ? () {}
                          : () async {
                              editCarBloc.add(const ChangeStatusEvent());
                              final allFiles = [
                                state.vehicleFile,
                                state.technicalPassportFileFront,
                                state.technicalPassportFileBack,
                                state.trailerPassportFileFront1,
                                state.trailerPassportFileBack1,
                                state.trailerPassportFileFront2,
                                state.trailerPassportFileBack2,
                                state.adrFrontFile,
                                state.adrBackFile,
                              ];
                              final imageFiles = await uploadMultipleFiles(allFiles);
                              editCarBloc.add(
                                UpdateCarEvent(
                                  request: updatedFields(
                                    state: state,
                                    vehicleImage: imageFiles[state.vehicleFile] ?? '',
                                    techPassportFront: imageFiles[state.technicalPassportFileFront] ?? '',
                                    techPassportBack: imageFiles[state.technicalPassportFileBack] ?? '',
                                    techPassportTrailerFront1: imageFiles[state.trailerPassportFileFront1] ?? '',
                                    techPassportTrailerBack1: imageFiles[state.trailerPassportFileBack1] ?? '',
                                    techPassportTrailerFront2: imageFiles[state.trailerPassportFileFront2] ?? '',
                                    techPassportTrailerBack2: imageFiles[state.trailerPassportFileBack2] ?? '',
                                    adrPictureFront: imageFiles[state.adrFrontFile] ?? '',
                                    adrPictureBack: imageFiles[state.adrBackFile] ?? '',
                                  ),
                                ),
                              );
                            },
                      child: Text('save'.tr()),
                    ),
                    AppUtils.kGap8,
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          context.color.midGrey5.withOpacity(0.3),
                        ),
                        foregroundColor: WidgetStateProperty.all(
                          context.colorScheme.primary,
                        ),
                      ),
                      onPressed: () async {
                        await showDialog<void>(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: editCarBloc,
                            child: DeleteCarDialog(
                              carId: widget.arguments.carGuid,
                            ),
                          ),
                        );
                      },
                      child: Text('delete'.tr()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
