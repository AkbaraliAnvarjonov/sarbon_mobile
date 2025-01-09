part of '../add_route_page.dart';

class _AddRouteItemWidget extends StatelessWidget {
  const _AddRouteItemWidget({
    required this.formKey,
    required this.carryingCapacityController,
    required this.volumeController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController carryingCapacityController;
  final TextEditingController volumeController;

  @override
  Widget build(BuildContext context) => BlocListener<AddRouteBloc, AddRouteState>(
        listener: (context, state) async {
          if (state.createRouteStatus.isSuccess) {
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
                BlocBuilder<AddRouteBloc, AddRouteState>(
                  buildWhen: (previous, current) => previous.toAddress != current.toAddress,
                  builder: (context, state) => CustomTextField(
                    labelText: 'to_where'.tr(),
                    hintText: 'enter_address'.tr(),
                    fillColor: context.colorScheme.surface,
                    contentPadding: AppUtils.kPaddingHorizontal12,
                    controller: TextEditingController(text: state.toAddress?.name ?? ''),
                    readOnly: true,
                    showBorder: false,
                    onTap: () async {
                      await customModalBottomSheet<void>(
                        context: context,
                        builder: (_, controller) => BlocProvider.value(
                          value: context.read<AddRouteBloc>(),
                          child: const SearchAddressRoutePageWidget(
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
                BlocBuilder<AddRouteBloc, AddRouteState>(
                  buildWhen: (previous, current) => previous.fromAddress != current.fromAddress,
                  builder: (context, state) => CustomTextField(
                    labelText: 'from_where'.tr(),
                    hintText: 'enter_address'.tr(),
                    fillColor: context.colorScheme.surface,
                    contentPadding: AppUtils.kPaddingHorizontal12,
                    controller: TextEditingController(text: state.fromAddress?.name ?? ''),
                    readOnly: true,
                    showBorder: false,
                    onTap: () async {
                      await customModalBottomSheet<void>(
                        context: context,
                        builder: (_, controller) => BlocProvider.value(
                          value: context.read<AddRouteBloc>(),
                          child: const SearchAddressRoutePageWidget(
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
                BlocBuilder<AddRouteBloc, AddRouteState>(
                  buildWhen: (previous, current) => previous.dateTime != current.dateTime,
                  builder: (context, state) => CustomTextField(
                    labelText: 'date'.tr(),
                    hintText: 'choose_date'.tr(),
                    fillColor: context.colorScheme.surface,
                    contentPadding: AppUtils.kPaddingHorizontal12,
                    controller: TextEditingController(
                      text: state.dateTime != null ? state.dateTime?.formatDate : '',
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
                          value: context.read<AddRouteBloc>(),
                          child: const SelectDateRoutePageWidget(),
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
                const _VehicleTypesWidget(),
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
                  contentPadding: AppUtils.kPaddingHorizontal12,
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
                  contentPadding: AppUtils.kPaddingHorizontal12,
                  textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                  textInputType: TextInputType.number,
                ),
                AppUtils.kGap12,
                BlocBuilder<AddRouteBloc, AddRouteState>(
                  buildWhen: (previous, current) =>
                      previous.toAddress != current.toAddress ||
                      previous.fromAddress != current.fromAddress ||
                      previous.dateTime != current.dateTime ||
                      previous.selectedVehicleType != current.selectedVehicleType,
                  builder: (context, state) => ElevatedButton(
                    onPressed: state.dateTime != null &&
                            (state.toAddress?.name ?? '').isNotEmpty &&
                            (state.fromAddress?.name ?? '').isNotEmpty &&
                            state.selectedVehicleType != null
                        ? () {
                            if (formKey.currentState!.validate()) {
                              context.read<AddRouteBloc>().add(
                                    CreateRouteEvent(
                                      capacity: carryingCapacityController.text,
                                      volume: volumeController.text,
                                    ),
                                  );
                            }
                          }
                        : null,
                    child: Text('add'.tr()),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
