part of '../opposite_offer_page.dart';

class _VehicleTypesWidget extends StatelessWidget {
  const _VehicleTypesWidget();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OppositeOfferBloc, OppositeOfferState>(
        buildWhen: (previous, current) =>
            previous.vehicleTypes != current.vehicleTypes ||
            previous.selectedVehicleType != current.selectedVehicleType,
        builder: (context, state) => Material(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
          child: InkWell(
            onTap: () async {
              await customModalBottomSheet<VehicleTypeItemEntity>(
                context: rootNavigatorKey.currentContext!,
                builder: (_, controller) => BlocProvider.value(
                  value: context.read<OppositeOfferBloc>(),
                  child: ChoseVehicleTypesBottomSheet(
                    state: state,
                  ),
                ),
                enableDrag: false,
                isScrollControlled: (state.vehicleTypes ?? []).length >= 4,
              );
            },
            borderRadius: AppUtils.kBorderRadius12,
            child: Ink(
              padding: AppUtils.kPaddingAll12,
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.onPrimary,
                border: Border.all(
                  color: context.color.borderColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.selectedVehicleType != null
                            ? (state.selectedVehicleType?.name ?? '')
                            : 'choose_vehicle'.tr(),
                        style: state.selectedVehicleType != null
                            ? context.textStyle.size15Weight500Black.copyWith(
                                color: context.color.textColor,
                              )
                            : context.textStyle.regularSubheadline.copyWith(
                                color: context.color.greyText,
                              ),
                      ),
                      Padding(
                        padding: AppUtils.kPaddingL4,
                        child: Text(
                          state.selectedVehicleType != null
                              ? '${'number_vehicle'.tr()}:'
                              ' ${state.selectedVehicleType?.carNumber ?? ''}'
                              : '',
                          style: context.textStyle.regularSubheadline.copyWith(
                                  color: context.color.greyText,
                                ),
                        ),
                      ),
                    ],
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
