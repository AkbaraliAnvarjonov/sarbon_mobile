import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

enum LocationPermissionHandle { denied, locationEnabled, success }

mixin class LocationMixin {
  LocationMixin._();

  // ignore: prefer_constructors_over_static_methods
  static LocationMixin get instance => LocationMixin._();
  final Location location = Location();

  Future<LocationPermissionHandle> hasPermission() async {
    var permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied || permission == geo.LocationPermission.deniedForever) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied || permission == geo.LocationPermission.deniedForever) {
        return LocationPermissionHandle.denied;
      }
    }
    final bool serEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serEnabled) {
      return LocationPermissionHandle.locationEnabled;
    }
    return LocationPermissionHandle.success;
  }

  Future<LocationPermissionHandle> onlyCheck() async {
    final permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied || permission == geo.LocationPermission.deniedForever) {}
    final bool serEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serEnabled) {
      return LocationPermissionHandle.locationEnabled;
    }
    return LocationPermissionHandle.success;
  }

  Future<bool> permission() async {
    late PermissionStatus permissionGranted;

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied || permissionGranted == PermissionStatus.deniedForever) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.denied || permissionGranted != PermissionStatus.deniedForever) {
        return false;
      }
    }
    return location.serviceEnabled();
  }

  Future<Point> determinePosition() async {
    if (!await permission()) {
      return determinePosition();
    }
    final position = await geo.Geolocator.getCurrentPosition(
      desiredAccuracy: geo.LocationAccuracy.low,
    );
    return Point(latitude: position.latitude, longitude: position.longitude);
  }

  Future<bool> isRequestService() async {
    if (!(await location.serviceEnabled())) {
      return location.requestService();
    }
    return true;
  }
}

class Points {
  const Points({required this.latitude, required this.longitude});

  /// The point's latitude.
  final double latitude;

  /// The point's longitude
  final double longitude;

  Map<String, dynamic> toJson() => {
        'lat': latitude,
        'long': longitude,
      };
}
