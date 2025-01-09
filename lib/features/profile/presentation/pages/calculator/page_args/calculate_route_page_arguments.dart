import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../data/models/address/address_model.dart';

class CalculateRoutePageArguments {
  final List<AddressModel> addAdditionalAddresses;
  final List<AddressDistanceTimeModel> addressDistanceTimeModels;
  final Future<DrivingSessionResult> result;
  final DrivingSession session;
  final PlacemarkMapObject startPlaceMark;
  final List<PlacemarkMapObject> additionalPlaceMarks;
  final PlacemarkMapObject endPlaceMark;

  const CalculateRoutePageArguments({
    required this.addAdditionalAddresses,
    required this.addressDistanceTimeModels,
    required this.result,
    required this.session,
    required this.startPlaceMark,
    required this.additionalPlaceMarks,
    required this.endPlaceMark,
  });
}
