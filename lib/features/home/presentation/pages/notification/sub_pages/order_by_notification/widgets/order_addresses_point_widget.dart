part of '../order_by_notification_page.dart';

class _OrderAddressesPointWidget extends StatelessWidget {
  const _OrderAddressesPointWidget({
    required this.addresses,
  });

  final List<OrderAddressesByNotificationPoint> addresses;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: AppUtils.kBorderRadius12,
        color: context.colorScheme.onPrimary,
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: Column(
            children: List.generate(
              addresses.length,
              (index) => OrderDirectionNotificationWidget(
                isLastItem: index == addresses.length - 1,
                details: addresses[index],
                isFirstItem: index == 0,
              ),
            ),
          ),
        ),
      );
}
