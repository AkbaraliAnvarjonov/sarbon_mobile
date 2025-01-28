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
                final pos = await LocationMixin.instance.determinePosition();
                // ignore: use_build_context_synchronously
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
                final pos = await LocationMixin.instance.determinePosition();
                // ignore: use_build_context_synchronously
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
