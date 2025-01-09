part of '../order_by_notification_page.dart';

class _OrderForDealButton extends StatelessWidget {
  const _OrderForDealButton();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: AppUtils.kDecorationWithShadow,
        child: BlocBuilder<OrderForNotificationBloc, OrderForNotificationState>(
          builder: (context, state) => SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: state.getOrderDetailsStatus.isLoading ||
                          (state.getOrderDetails?.statuses?.firstOrNull ??
                                  'approve_by_customer') ==
                              'approve_by_customer'
                      ? null
                      : () async {
                          context.read<OrderForNotificationBloc>().add(
                                SendDealOrderEvent(
                                  orderId: state.getOrderDetails?.guid ?? '',
                                  cargoId:
                                      state.getOrderDetails?.cargoId ?? '',
                                ),
                              );
                        },
                  child: const Text('Принять'),
                ),
                AppUtils.kGap16,
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      context.colorScheme.primary,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      context.color.backgroundTabBarColor,
                    ),
                  ),
                  onPressed: state.getOrderDetailsStatus.isLoading
                      ? null
                      : () {
                          context.read<OrderForNotificationBloc>().add(
                                CancelOrderEvent(
                                  orderId: state.getOrderDetails?.guid ?? '',
                                ),
                              );
                        },
                  child: const Text(
                    'Отказать',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
