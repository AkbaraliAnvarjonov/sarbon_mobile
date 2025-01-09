import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationInfo {
  final Point point;
  final String locationName;

  LocationInfo({
    required this.locationName,
    required this.point,
  });
}
