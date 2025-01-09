part of 'update_route_item_widget.dart';

class _VehicleTypesWidget extends StatelessWidget {
  const _VehicleTypesWidget({
    required this.vehicleId,
  });

  final String vehicleId;

  @override
  Widget build(BuildContext context) => BlocBuilder<UpdateRouteBloc, UpdateRouteState>(
        buildWhen: (previous, current) =>
            previous.vehicleTypes != current.vehicleTypes ||
            previous.selectedVehicleType != current.selectedVehicleType,
        builder: (context, state) {
          if (state.vehicleTypes.isNotEmpty && state.selectedVehicleType == null) {
            context.read<UpdateRouteBloc>().add(
                  SelectVehicleTypesEvent(
                    vehicleType: state.vehicleTypes.firstWhere(
                      (element) => element.guid == vehicleId,
                      orElse: () => state.vehicleTypes.first,
                    ),
                  ),
                );
          }
          return Material(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.colorScheme.onPrimary,
            child: InkWell(
              onTap: () async {
                await customModalBottomSheet<VehicleTypeItemEntity>(
                  context: rootNavigatorKey.currentContext!,
                  builder: (_, controller) => BlocProvider.value(
                    value: context.read<UpdateRouteBloc>(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: AppUtils.kPaddingAll16,
                          child: Row(
                            children: [
                              if (state.vehicleTypes.isEmpty) AppUtils.kGap24,
                              Expanded(
                                child: Text(
                                  state.vehicleTypes.isNotEmpty
                                      ? 'choose_vehicle'.tr()
                                      : 'У вас пока нет \n добавленных машин',
                                  style: state.vehicleTypes.isNotEmpty
                                      ? context.textStyle.appBarTitle
                                      : context.textStyle.appBarTitle.copyWith(
                                          color: context.color.lightGray,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  textAlign: state.vehicleTypes.isNotEmpty ? TextAlign.left : TextAlign.center,
                                  maxLines: 3,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.pop();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppUtils.kDivider,
                        if (state.vehicleTypes.isNotEmpty) AppUtils.kGap16,
                        Visibility(
                          visible: state.vehicleTypes.isNotEmpty,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (_, index) => ListTile(
                              contentPadding: AppUtils.kPaddingHorizontal16,
                              onTap: () {
                                context.read<UpdateRouteBloc>().add(
                                      SelectVehicleTypesEvent(
                                        vehicleType: state.vehicleTypes[index],
                                      ),
                                    );
                                context.pop();
                              },
                              title: Text(
                                state.vehicleTypes[index].name ?? '',
                                style: context.textStyle.size15Weight500Black.copyWith(
                                  color: context.color.textColor,
                                ),
                              ),
                              leading: SvgPicture.asset(
                                state.selectedVehicleType?.guid == state.vehicleTypes[index].guid
                                    ? SvgImage.icRadioOn
                                    : SvgImage.icRadioOff,
                              ),
                            ),
                            itemCount: state.vehicleTypes.length,
                            separatorBuilder: (_, index) => const Padding(
                              padding: AppUtils.kPaddingHor16Ver8,
                              child: AppUtils.kDivider,
                            ),
                          ),
                        ),
                        AppUtils.kSpacer,
                        SafeArea(
                          minimum: AppUtils.kPaddingAll16,
                          child: ElevatedButton(
                            onPressed: () async {
                              await context.pushNamed(Routes.addCar).then((value) {
                                if (!context.mounted) return;
                                context.pop();
                                context.read<UpdateRouteBloc>().add(
                                      const FetchVehicleTypesEvent(),
                                    );
                              });
                            },
                            child: Text('add_car'.tr()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  enableDrag: false,
                  isScrollControlled: state.vehicleTypes.length >= 4,
                );
              },
              borderRadius: AppUtils.kBorderRadius8,
              child: Padding(
                padding: AppUtils.kPaddingAll12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.selectedVehicleType != null
                          ? (state.selectedVehicleType?.name ?? '')
                          : 'choose_vehicle'.tr(),
                      style: state.selectedVehicleType != null
                          ? context.textStyle.regularCallout.copyWith(
                              color: context.color.textColor,
                            )
                          : context.textStyle.regularCallout.copyWith(
                              color: context.color.greyText,
                            ),
                    ),
                    SvgPicture.asset(
                      SvgImage.icArrowDropdown,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
