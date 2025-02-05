part of '../calculator_page.dart';

class _FromToAddressWidget extends StatelessWidget {
  const _FromToAddressWidget();

  @override
  Widget build(BuildContext context) => BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                'to_where'.tr(),
                style: context.textStyle.regularFootnote.copyWith(
                  color: context.color.greyText,
                ),
              ),
              subtitle: Text(
                state.fromAddress?.name ?? 'select_address'.tr(),
                style: context.textStyle.regularCallout,
              ),
              onTap: () async {
                context.read<CalculatorBloc>().add(const ChangeStatusEvent(status: ApiStatus.loading));
                Point? pos;

                final result = await LocationMixin.instance.hasPermission();

                if (result == LocationPermissionHandle.denied || result == LocationPermissionHandle.locationEnabled) {
                  if (!context.mounted) return;
                  await customModalBottomSheet<void>(
                    context: context,
                    builder: (_, controller) => const LocationBottomSheet(),
                  );
                }

                if (await LocationMixin.instance.onlyCheck() == LocationPermissionHandle.success) {
                  pos = await LocationMixin.instance.determinePosition();
                } else {
                  return;
                }
                if (!context.mounted) return;
                context.read<CalculatorBloc>().add(const ChangeStatusEvent(status: ApiStatus.success));
                await context
                    .pushNamed(
                  Routes.mapForCalculator,
                  extra: MapPageArguments(
                    userLatitude: pos.latitude,
                    userLongitude: pos.longitude,
                  ),
                )
                    .then(
                  (value) {
                    if (value != null && value is AddressModel) {
                      if (!context.mounted) return;
                      context.read<CalculatorBloc>().add(
                            SetFromAddressEvent(
                              address: value,
                            ),
                          );
                    }
                  },
                );
              },
            ),
            AppUtils.kPad12Divider,
            ListTile(
              title: Text(
                'from_where'.tr(),
                style: context.textStyle.regularFootnote.copyWith(
                  color: context.color.greyText,
                ),
              ),
              subtitle: Text(
                state.toAddress?.name ?? 'select_address'.tr(),
                style: context.textStyle.regularCallout,
              ),
              onTap: () async {
                context.read<CalculatorBloc>().add(const ChangeStatusEvent(status: ApiStatus.loading));
                Point? pos;

                final result = await LocationMixin.instance.hasPermission();

                if (result == LocationPermissionHandle.denied || result == LocationPermissionHandle.locationEnabled) {
                  if (!context.mounted) return;
                  await customModalBottomSheet<void>(
                    context: context,
                    builder: (_, controller) => const LocationBottomSheet(),
                  );
                }

                if (await LocationMixin.instance.onlyCheck() == LocationPermissionHandle.success) {
                  pos = await LocationMixin.instance.determinePosition();
                } else {
                  return;
                }

                if (!context.mounted) return;
                context.read<CalculatorBloc>().add(const ChangeStatusEvent(status: ApiStatus.success));

                await context
                    .pushNamed(
                  Routes.mapForCalculator,
                  extra: MapPageArguments(
                    userLatitude: pos.latitude,
                    userLongitude: pos.longitude,
                  ),
                )
                    .then(
                  (value) {
                    if (value != null && value is AddressModel) {
                      if (!context.mounted) return;
                      context.read<CalculatorBloc>().add(
                            SetToAddressEvent(
                              address: value,
                            ),
                          );
                    }
                  },
                );
              },
            ),
            AppUtils.kPad12Divider,
          ],
        ),
      );
}
