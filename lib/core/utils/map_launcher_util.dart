import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

import '../extension/extension.dart';
import '../mixins/location_mixin.dart';
import '../widgets/map_launch/maps_bottom_sheet.dart';

Future<void> launchMapOnDeviceMap(
  Points startPoint,
  BuildContext context, [
  String? title,
]) async {
  final List<AvailableMap> maps = await MapLauncher.installedMaps;
  final List<MapIconName> list = [];
  for (final element in maps) {
    list.add(MapIconName(element.mapName, element.icon));
  }
  final pos = await LocationMixin.instance.determinePosition();
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
          origin: Coords(pos.latitude, pos.longitude),
          waypoints: [],
        );
      },
    ),
  );
}
