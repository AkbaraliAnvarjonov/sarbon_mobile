import 'dart:developer';

import 'package:geolocator/geolocator.dart';

const (double, double) point = (41.2995, 69.2401);

sealed class LocationService {
  Future<LocationPermission> hasPermission();

  Future<bool> openAppSettings();

  Future<bool> openLocationSettings();

  Future<Position> currentPosition();

  Future<Position> determinePosition();
}

class LocationServiceImpl implements LocationService {
  LocationServiceImpl();

  @override
  Future<LocationPermission> hasPermission() async {
    late LocationPermission permission;
    log('location --> kirdi');

    permission = await Geolocator.checkPermission();
    log('location --> permission: $permission');

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // permission = await Geolocator.requestPermission();
      log('location --> permission (after): $permission');
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return permission;
      }
    }
    return permission;
  }

  @override
  Future<bool> openLocationSettings() async =>
      Geolocator.openLocationSettings();

  @override
  Future<bool> openAppSettings() async => Geolocator.openAppSettings();

  @override
  Future<Position> determinePosition() async {
    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Future<Position> currentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    return position;
  }
}
