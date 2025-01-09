part of '../add_route_page.dart';

class _VehicleTypesWidget extends StatelessWidget {
  const _VehicleTypesWidget();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AddRouteBloc, AddRouteState>(
        buildWhen: (previous, current) =>
            previous.vehicleTypes != current.vehicleTypes ||
            previous.selectedVehicleType != current.selectedVehicleType,
        builder: (context, state) => Material(
          borderRadius: AppUtils.kBorderRadius8,
          color: context.colorScheme.onPrimary,
          child: InkWell(
            onTap: () async {
              await customModalBottomSheet<VehicleTypeItemEntity>(
                context: rootNavigatorKey.currentContext!,
                builder: (_, controller) => BlocProvider.value(
                  value: context.read<AddRouteBloc>(),
                  child: ChoseVehicleRoutePageBottomSheet(
                    state: state,
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
        ),
      );
}
