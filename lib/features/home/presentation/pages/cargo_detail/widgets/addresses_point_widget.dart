part of '../cargo_detail_page.dart';

class _AddressesPointWidget extends StatelessWidget {
  const _AddressesPointWidget({
    required this.addresses,
    required this.addressPositions,
    required this.details,
  });

  final List<CargoAddressesPoint> addresses;
  final List<FetchListPositionsEntity> addressPositions;

  final GetCargoDetailsResponseEntity? details;

  @override
  Widget build(BuildContext context) => Column(
        children: List.generate(
          addressPositions.length,
          (index) => CargoDirectionWithDiagramInfoWidget(
            details: addressPositions[index],
            isLastItem: index == addressPositions.length - 1,
            isFirstItem: index == 0,
            from: details?.countryCodeFrom ?? '',
            to: details?.countryCodeTo ?? '',
            distance: details?.distance ?? '',
            onTap: () async {
              await launchMapOnDeviceMap(
                Points(latitude: addressPositions[index].lat, longitude: addressPositions[index].long),
                context,
              );
            },
          ),
        ),
      );
}
