import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../features/main/presentation/pages/widgets/location_bottom_sheet.dart';
import '../extension/extension.dart';
import '../mixins/location_mixin.dart';
import '../widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../widgets/map_launch/maps_bottom_sheet.dart';

Future<void> launchMapOnDeviceMap({
  required Points startPoint,
  Points? endPoint,
  required BuildContext context,
}) async {
  final List<AvailableMap> maps = await MapLauncher.installedMaps;
  final List<MapIconName> list = [];
  Point? pos;
  for (final element in maps) {
    list.add(MapIconName(element.mapName, element.icon));
  }
  final result = await LocationMixin.instance.hasPermission();

  if (result == LocationPermissionHandle.denied || result == LocationPermissionHandle.locationEnabled) {
    if (!context.mounted) return;
    await customModalBottomSheet<void>(
      context: context,
      builder: (_, controller) => const LocationBottomSheet(),
    );
  }

  if (endPoint == null) {
    if (await LocationMixin.instance.onlyCheck() == LocationPermissionHandle.success) {
      pos = await LocationMixin.instance.determinePosition();
    } else {
      return;
    }
  } else {
    pos = Point(latitude: endPoint.latitude, longitude: endPoint.longitude);
  }

  if (!context.mounted) return;
  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: false,
    builder: (context) => MapsListBottomSheet(
      mapList: list,
      onTap: (index) async {
        Navigator.pop(context);
        await MapLauncher.showDirections(
          originTitle: 'my_address'.tr(),
          mapType: maps[index].mapType,
          destination: Coords(startPoint.latitude, startPoint.longitude),
          origin: Coords(pos?.latitude ?? 0, pos?.longitude ?? 0),
          waypoints: [],
        );
      },
    ),
  );
}
