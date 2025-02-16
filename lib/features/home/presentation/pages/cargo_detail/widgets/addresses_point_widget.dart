part of '../cargo_detail_page.dart';

class _AddressesPointWidget extends StatelessWidget {
  const _AddressesPointWidget({required this.addresses, required this.addressPositions});

  final List<CargoAddressesPoint> addresses;
  final List<FetchListPositionsEntity> addressPositions;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: AppUtils.kBorderRadius12,
        color: context.colorScheme.onPrimary,
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: Column(
            children: List.generate(
              addressPositions.length,
              (index) => CargoDirectionWithDiagramInfoWidget(
                details: addressPositions[index],
                isLastItem: index == addressPositions.length - 1,
                isFirstItem: index == 0,
                onTap: () async {
                  await launchMapOnDeviceMap(
                    Points(latitude: addressPositions[index].lat, longitude: addressPositions[index].long),
                    context,
                  );
                },
              ),
            ),
          ),
        ),
      );
}
