import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../../../constants/icons_constants.dart';
import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../../core/widgets/search_widget/flappy_search_bar.dart';
import '../../../../../../../../core/widgets/search_widget/search_empty_widget.dart';
import '../../../../../../../../injector_container.dart';
import '../../../../../../../../router/app_routes.dart';
import '../../../../../../domain/entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../../../../../../domain/entities/routes/fetch_routes_entity.dart';
import '../../../../../../domain/usecases/get_addresses_usecase.dart';
import '../../../../../bloc/route/update_route/update_route_bloc.dart';
import 'search_found_item_widget.dart';

part '../../../../mixin/update_route_mixin.dart';
part 'search_address_widget.dart';
part 'select_date_widget.dart';
part 'vehicle_types_widget.dart';

class UpdateRouteItemWidget extends StatefulWidget {
  const UpdateRouteItemWidget({
    super.key,
    required this.route,
  });

  final RouteEntity route;

  @override
  State<UpdateRouteItemWidget> createState() => _UpdateRouteItemWidgetState();
}

class _UpdateRouteItemWidgetState extends State<UpdateRouteItemWidget>
    with UpdateRouteMixin {
  @override
  Widget build(BuildContext context) =>
      BlocListener<UpdateRouteBloc, UpdateRouteState>(
        listenWhen: (previous, current) =>
            previous.updateRouteStatus != current.updateRouteStatus,
        listener: (context, state) async {
          if (state.updateRouteStatus.isSuccess) {
            context.pop(true);
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<UpdateRouteBloc, UpdateRouteState>(
                  buildWhen: (previous, current) =>
                      previous.toAddress != current.toAddress,
                  builder: (context, state) => CustomTextField(
                    labelText: 'to_where'.tr(),
                    hintText: 'enter_address'.tr(),
                    fillColor: context.colorScheme.surface,
                    contentPadding: AppUtils.kPaddingHorizontal12,
                    controller: TextEditingController(
                      text: context.locale.languageCode == 'ru'
                          ? state.toAddress?.addressNameRu.isNotEmpty ?? false
                              ? '${state.toAddress?.cityNameRu} - ${state.toAddress?.addressNameRu}'
                              : ''
                          : state.toAddress?.addressNameEn.isNotEmpty ?? false
                              ? '${state.toAddress?.cityNameEn} - ${state.toAddress?.addressNameEn}'
                              : '',
                    ),
                    readOnly: true,
                    showBorder: false,
                    onTap: () async {
                      await customModalBottomSheet<void>(
                        context: context,
                        builder: (_, controller) => BlocProvider.value(
                          value: updateRouteBloc,
                          child: const _SearchAddressUpdateRoutePageWidget(
                            isForInitialPointOfAddress: false,
                          ),
                        ),
                        enableDrag: false,
                        isScrollControlled: true,
                      );
                    },
                  ),
                ),
                AppUtils.kGap12,
                BlocBuilder<UpdateRouteBloc, UpdateRouteState>(
                  buildWhen: (previous, current) =>
                      previous.fromAddress != current.fromAddress,
                  builder: (context, state) => CustomTextField(
                    labelText: 'from_where'.tr(),
                    hintText: 'enter_address'.tr(),
                    fillColor: context.colorScheme.surface,
                    contentPadding: AppUtils.kPaddingHorizontal12,
                    controller: TextEditingController(
                      text: context.locale.languageCode == 'ru'
                          ? state.fromAddress?.addressNameRu.isNotEmpty ?? false
                              ? '${state.fromAddress?.cityNameRu} - ${state.fromAddress?.addressNameRu}'
                              : ''
                          : state.fromAddress?.addressNameEn.isNotEmpty ?? false
                              ? '${state.fromAddress?.cityNameEn} - ${state.fromAddress?.addressNameEn}'
                              : '',
                    ),
                    readOnly: true,
                    showBorder: false,
                    onTap: () async {
                      await customModalBottomSheet<void>(
                        context: context,
                        builder: (_, controller) => BlocProvider.value(
                          value: updateRouteBloc,
                          child: const _SearchAddressUpdateRoutePageWidget(
                            isForInitialPointOfAddress: true,
                          ),
                        ),
                        enableDrag: false,
                        isScrollControlled: true,
                      );
                    },
                  ),
                ),
                AppUtils.kGap12,
                BlocBuilder<UpdateRouteBloc, UpdateRouteState>(
                  buildWhen: (previous, current) =>
                      previous.dateTime != current.dateTime,
                  builder: (context, state) => CustomTextField(
                    labelText: 'date'.tr(),
                    hintText: 'choose_date'.tr(),
                    fillColor: context.colorScheme.surface,
                    contentPadding: AppUtils.kPaddingHorizontal12,
                    controller: TextEditingController(
                      text: state.dateTime ?? '',
                    ),
                    readOnly: true,
                    showBorder: false,
                    suffixIcon: Padding(
                      padding: AppUtils.kPaddingAll14,
                      child: SvgPicture.asset(
                        SvgImage.calendar,
                      ),
                    ),
                    onTap: () async {
                      await customModalBottomSheet<void>(
                        context: context,
                        builder: (_, controller) => BlocProvider.value(
                          value: updateRouteBloc,
                          child: _SelectDateRoutePageWidget(
                            initialSelectedDate: state.selectedDate ??
                                DateFormat(
                                  'dd.MM.yyyy HH:mm',
                                  localSource.localeName,
                                ).parse(widget.route.date),
                          ),
                        ),
                        enableDrag: false,
                      );
                    },
                  ),
                ),
                AppUtils.kGap12,
                Text(
                  'type_vehicle'.tr(),
                  style: context.textStyle.size14Weight500Black.copyWith(
                    color: context.color.gray700,
                  ),
                ),
                AppUtils.kGap6,
                _VehicleTypesWidget(
                  vehicleId: widget.route.vehicleId,
                ),
                AppUtils.kGap12,
                CustomTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_capacity'.tr();
                    }
                    return null;
                  },
                  labelText: 'load_capacity'.tr(),
                  hintText: 'write_weight_of_cargo'.tr(),
                  controller: carryingCapacityController,
                  fillColor: context.colorScheme.surface,
                  showBorder: false,
                  contentPadding: AppUtils.kPaddingAll12,
                  textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                  textInputType: TextInputType.number,
                ),
                AppUtils.kGap12,
                CustomTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_volume'.tr();
                    }
                    return null;
                  },
                  labelText: 'volume_m³'.tr(),
                  hintText: 'write_volume_cargo'.tr(),
                  controller: volumeController,
                  fillColor: context.colorScheme.surface,
                  showBorder: false,
                  contentPadding: AppUtils.kPaddingAll12,
                  textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                  textInputType: TextInputType.number,
                ),
                AppUtils.kGap12,
                BlocBuilder<UpdateRouteBloc, UpdateRouteState>(
                  buildWhen: (previous, current) =>
                      previous.toAddress != current.toAddress ||
                      previous.fromAddress != current.fromAddress ||
                      previous.dateTime != current.dateTime,
                  builder: (context, state) => ElevatedButton(
                    onPressed: state.dateTime != null &&
                            (state.toAddress?.addressName ?? '').isNotEmpty &&
                            (state.fromAddress?.addressName ?? '').isNotEmpty
                        ? () {
                            if (formKey.currentState!.validate()) {
                              updateRouteBloc.add(
                                PutRouteEvent(
                                  guid: widget.route.guid,
                                  capacity: carryingCapacityController.text,
                                  volume: volumeController.text,
                                ),
                              );
                            }
                          }
                        : null,
                    child: Text('change'.tr()),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
