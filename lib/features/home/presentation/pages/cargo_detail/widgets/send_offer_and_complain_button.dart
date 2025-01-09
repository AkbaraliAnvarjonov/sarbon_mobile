part of '../cargo_detail_page.dart';

class _SendOfferAndComplainButton extends StatelessWidget {
  const _SendOfferAndComplainButton();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: AppUtils.kDecorationWithShadow,
        child: BlocBuilder<CargoDetailsBloc, CargoDetailsState>(
          buildWhen: (previous, current) =>
              previous.status != current.status || previous.signedOrdersStatus != current.signedOrdersStatus,
          builder: (context, state) => SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: state.status.isLoading || state.signedOrdersStatus.isLoading
                      ? null
                      : () async {
                          if (state.finishedOrdersCount == 0) {
                            await context
                                .pushNamed(
                              Routes.oppositeOffer,
                              extra: OppositeOfferPageArguments(
                                firmId2: state.details?.firmId ?? '',
                                cargoGuid: state.details?.guid ?? '',
                                noHaggling: state.details?.noHaggling ?? false,
                                usersId2: state.details?.usersId ?? '',
                                currency: state.details?.bidCash?.toString() ?? '',
                              ),
                            )
                                .then(
                              (value) {
                                if (value != null && value == true) {
                                  if (!context.mounted) return;
                                  context.pop(true);
                                }
                              },
                            );
                          } else {
                            await customModalBottomSheet<void>(
                              context: context,
                              builder: (_, controller) => const AlreadyOrderBottomSheet(),
                            );
                          }
                        },
                  child: Text('send_offer'.tr()),
                ),
                // AppUtils.kGap16,
                // ElevatedButton(
                //   style: ButtonStyle(
                //     foregroundColor: MaterialStateProperty.all<Color>(
                //       context.colorScheme.primary,
                //     ),
                //     backgroundColor: MaterialStateProperty.all<Color>(
                //       context.color.backgroundTabBarColor,
                //     ),
                //   ),
                //   onPressed: state.status.isLoading ? null : () {},
                //   child: Text(
                //     'complain'.tr(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
