part of '../order_detail_page.dart';

class _OrderAddressesPointWidget extends StatelessWidget {
  const _OrderAddressesPointWidget({
    required this.addresses,
    required this.isForDeal,
  });

  final List<OrderAddressesPoint> addresses;
  final bool isForDeal;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Material(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
          child: Padding(
            padding: AppUtils.kPaddingAll12,
            child: Column(
              children: List.generate(
                addresses.length,
                (index) => OrderDirectionWithDiagramInfoWidget(
                  isLastItem: index == addresses.length - 1,
                  isForDeal: isForDeal,
                  details: addresses[index],
                  isFirstItem: index == 0,
                  onTap: () async {
                    await launchMapOnDeviceMap(
                      startPoint: Points(
                        latitude: addresses[index].lat,
                        longitude: addresses[index].long,
                      ),
                      context: context,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
}
