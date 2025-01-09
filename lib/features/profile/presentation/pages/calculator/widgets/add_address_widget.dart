part of '../calculator_page.dart';

class _AddAddressButtonWidget extends StatelessWidget {
  const _AddAddressButtonWidget();

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll12,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              context.colorScheme.primary.withOpacity(0.15),
            ),
            foregroundColor: WidgetStateProperty.all(
              context.colorScheme.primary,
            ),
          ),
          onPressed: context.select(
                        (CalculatorBloc bloc) => bloc.state.toAddress,
                      ) ==
                      null ||
                  context.select(
                        (CalculatorBloc bloc) => bloc.state.fromAddress,
                      ) ==
                      null
              ? null
              : () async {
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
                        if(!context.mounted) return;
                        context.read<CalculatorBloc>().add(
                              AddAdditionalAddressEvent(
                                address: value,
                              ),
                            );
                      }
                    },
                  );
                },
          child: Text('add_waypoint'.tr()),
        ),
      );
}
