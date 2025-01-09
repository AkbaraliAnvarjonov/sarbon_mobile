part of '../calculator/sub_pages/map_page.dart';

mixin MapForCalculatorMixin on State<MapForCalculatorPage> {
  final Completer<YandexMapController> _yandexMapController =
      Completer<YandexMapController>();

  late ValueNotifier<SearchedLocation> _searchedLocation;
  late TextEditingController _addressController;

  @override
  void initState() {
    _searchedLocation = ValueNotifier(const SearchedLocation());
    _addressController = TextEditingController();
    super.initState();
  }

  Future<SearchedLocation> _getFindLocationName(
    SearchResultWithSession search,
  ) async {
    final searchResult = await search.result;
    final data = searchResult.items?.first.toponymMetadata;
    final addressList = data?.address.formattedAddress.split(', ') ?? [];
    if (addressList.length > 2) {
      addressList.removeAt(0);
    }
    final address = addressList.join(', ');
    final latitude = data?.balloonPoint.latitude ?? 0;
    final longitude = data?.balloonPoint.longitude ?? 0;
    return SearchedLocation(
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

class SearchedLocation extends Equatable {
  final double latitude;
  final double longitude;
  final String address;

  const SearchedLocation({
    this.latitude = 0,
    this.longitude = 0,
    this.address = '',
  });

  Point get toPoint => Point(
        latitude: latitude,
        longitude: longitude,
      );

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        address,
      ];
}
