part of '../calculator/sub_pages/calculate_route_page.dart';

mixin CalculateRouteMixin on State<CalculateRoutePage> {
  String distance = '';
  String time = '';
  late final List<MapObject> mapObjects = [
    widget.arguments.startPlaceMark,
    ...widget.arguments.additionalPlaceMarks,
    widget.arguments.endPlaceMark,
  ];

  late final List<AddressDistanceTimeModel> addressDistanceTimeModels = [];

  @override
  void initState() {
    super.initState();
    unawaited(_init());
  }

  Future<void> _init() async {
     _handleResult(await widget.arguments.result);
  }

  void _handleResult(DrivingSessionResult result) {
    setState(
      () {
          result.routes!.asMap().forEach(
          (i, route) {
            addressDistanceTimeModels.addAll(
              [
                ...widget.arguments.addressDistanceTimeModels,
                AddressDistanceTimeModel(
                  distance: route.metadata.weight.distance.text,
                  time: route.metadata.weight.time.text,
                ),
              ],
            );
            distance = route.metadata.weight.distance.text;
            time = route.metadata.weight.time.text;
            mapObjects.add(
              PolylineMapObject(
                mapId: MapObjectId('route_${i}_polyline'),
                polyline: Polyline(points: route.geometry),
                strokeColor: context.colorScheme.primary,
                strokeWidth: 3,
              ),
            );
          },
        );
      },
    );
  }

  Point findMidpoint(Point first, Point second) {
    final double lat1 = degreesToRadians(first.latitude);
    final double lon1 = degreesToRadians(first.longitude);
    final double lat2 = degreesToRadians(second.latitude);
    final double lon2 = degreesToRadians(second.longitude);

    final double bx = cos(lat2) * cos(lon2 - lon1);
    final double by = cos(lat2) * sin(lon2 - lon1);

    final double lat3 = atan2(
      sin(lat1) + sin(lat2),
      sqrt((cos(lat1) + bx) * (cos(lat1) + bx) + by * by),
    );
    final double lon3 = lon1 + atan2(by, cos(lat1) + bx);

    return Point(
      latitude: radiansToDegrees(lat3),
      longitude: radiansToDegrees(lon3),
    );
  }

  double degreesToRadians(double degrees) => degrees * pi / 180.0;

  double radiansToDegrees(double radians) => radians * 180.0 / pi;
}
