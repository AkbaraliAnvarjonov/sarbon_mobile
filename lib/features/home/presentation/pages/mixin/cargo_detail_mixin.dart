part of '../cargo_detail/cargo_detail_page.dart';

mixin CargoDetailMixin on State<CargoDetailPage> {
  DrivingResultWithSession? sessions;
  final List<MapObject> mapObjects = [];

  @override
  void initState() {
    context.read<CargoDetailsBloc>().add(GetCargoDetailsEvent(guid: widget.cargoId));
    context.read<CargoDetailsBloc>().add(const GetDriverOrdersEvent());
    super.initState();
  }

  void _handleResult(DrivingSessionResult result) {
    print('mana');
    setState(
      () {
        result.routes!.asMap().forEach(
          (i, route) {
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

  Future routes() async {
    mapObjects.add(PlacemarkMapObject(
      mapId: const MapObjectId('start_placemark'),
      point: Point(
        latitude: context.read<CargoDetailsBloc>().state.addressPositions.first.lat,
        longitude: context.read<CargoDetailsBloc>().state.addressPositions.first.long,
      ),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            PngImage.startPoint,
          ),
        ),
      ),
    ));
    mapObjects.add(PlacemarkMapObject(
      mapId: const MapObjectId('start_placemark'),
      point: Point(
        latitude: context.read<CargoDetailsBloc>().state.addressPositions.last.lat,
        longitude: context.read<CargoDetailsBloc>().state.addressPositions.last.long,
      ),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            PngImage.startPoint,
          ),
        ),
      ),
    ));

    final List<RequestPoint> points = [];
    context.read<CargoDetailsBloc>().state.addressPositions.forEach((e) {
      points.add(
          RequestPoint(point: Point(latitude: e.lat, longitude: e.long), requestPointType: RequestPointType.wayPoint));
    });
    sessions = YandexDriving.requestRoutes(
      points: points,
      drivingOptions: const DrivingOptions(
        initialAzimuth: 0,
        routesCount: 1,
        avoidTolls: true,
      ),
    );
    _handleResult(await sessions!.result);
    print(sessions);
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
