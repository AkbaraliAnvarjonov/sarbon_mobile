part of '../order_detail_page.dart';

class _SignedOrderButton extends StatelessWidget {
  const _SignedOrderButton({
    required this.orderId,
    required this.carType,
  });

  final String orderId;
  final String carType;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: AppUtils.kDecorationWithShadow,
        child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
          buildWhen: (previous, current) => previous.orderDetailStatus != current.orderDetailStatus,
          builder: (context, state) => SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: ElevatedButton(
              onPressed: state.orderDetailStatus.isLoading
                  ? null
                  : () async {
                      await customModalBottomSheet<bool>(
                        context: rootNavigatorKey.currentContext!,
                        builder: (_, controller) => BlocProvider.value(
                          value: context.read<OrderDetailsBloc>(),
                          child: ChooseStatusForDetailPageWidget(orderId: orderId, carType: carType),
                        ),
                        enableDrag: false,
                        isScrollControlled: true,
                      ).then(
                        (value) {
                          if (value != null && value) {
                            customModalBottomSheet<bool>(
                              context: rootNavigatorKey.currentContext!,
                              builder: (_, controller) => BlocProvider.value(
                                value: context.read<OrderDetailsBloc>(),
                                child: GiveFeedbackAndRatingDetailPageWidget(
                                  state: state,
                                ),
                              ),
                              enableDrag: false,
                              isScrollControlled: true,
                            ).then(
                              (value) {
                                if (value != null) {
                                  Future<void>.delayed(
                                    const Duration(
                                      milliseconds: 500,
                                    ),
                                  ).then((value) {
                                    if (!context.mounted) return;
                                    context.pop(true);
                                  });
                                }
                              },
                            );
                          }
                        },
                      );
                    },
              child: Text('show_status'.tr()),
            ),
          ),
        ),
      );
}
