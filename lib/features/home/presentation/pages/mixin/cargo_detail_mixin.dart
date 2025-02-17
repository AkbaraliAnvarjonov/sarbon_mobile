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
    setState(
      () {
        result.routes!.asMap().forEach(
          (i, route) {
            mapObjects.add(
              PolylineMapObject(
                mapId: MapObjectId('route_${i}_polyline'),
                polyline: Polyline(points: route.geometry),
                strokeColor: Colors.black,
                dashLength: 4,
                dashOffset: 4,
                gapLength: 4,
                outlineWidth: 4,
                gradientLength: 4,
                strokeWidth: 2,
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
    mapObjects.add(
      PlacemarkMapObject(
        mapId: const MapObjectId('end-placemark'),
        point: Point(
          latitude: context.read<CargoDetailsBloc>().state.addressPositions.last.lat,
          longitude: context.read<CargoDetailsBloc>().state.addressPositions.last.long,
        ),
        opacity: 1,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
              PngImage.endPoint,
            ),
          ),
        ),
      ),
    );

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

  double haversine(double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371; // Earth radius in km
    double dLat = (lat2 - lat1) * (pi / 180);
    double dLon = (lon2 - lon1) * (pi / 180);
    double a =
        sin(dLat / 2) * sin(dLat / 2) + cos(lat1 * (pi / 180)) * cos(lat2 * (pi / 180)) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double getYandexZoom(double lat1, double lon1, double lat2, double lon2) {
    double distance = haversine(lat1, lon1, lat2, lon2);

    if (distance < 1) {
      return 13;
    } else if (distance < 5) {
      return 12;
    } else if (distance < 10) {
      return 11;
    } else if (distance < 20) {
      return 10;
    } else if (distance < 50) {
      return 9;
    } else if (distance < 100) {
      return 8;
    } else if (distance < 200) {
      return 7;
    } else if (distance < 500) {
      return 6;
    } else if (distance < 1000) {
      return 5;
    } else if (distance < 2000) {
      return 4;
    } else if (distance < 5000) {
      return 3;
    } else {
      return 2; // World view
    }
  }

  double calculateMoneyPerKm(String distance, int money) {
    // Extract numeric value from the distance string
    double distanceInKm = double.tryParse(distance.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

    // Prevent division by zero
    if (distanceInKm == 0) return 0;

    // Calculate money per km and round to 2 decimal places
    return double.parse((money / distanceInKm).toStringAsFixed(2));
  }
}
