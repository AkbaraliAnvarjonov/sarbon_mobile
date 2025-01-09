part of '../calculator/calculator_page.dart';

mixin CalculatorPageMixin on State<CalculatorPage> {
  Future<void> _requestRoutes({required CalculatorState state}) async {
    final List<AddressDistanceTimeModel> addressDistanceTimeModels = [];
    final List<RequestPoint> points = [
      RequestPoint(
        point: Point(
          latitude: state.fromAddress!.latitude,
          longitude: state.fromAddress!.longitude,
        ),
        requestPointType: RequestPointType.wayPoint,
      ),
      ...state.addAdditionalAddresses.map(
        (address) => RequestPoint(
          point: Point(
            latitude: address.latitude,
            longitude: address.longitude,
          ),
          requestPointType: RequestPointType.wayPoint,
        ),
      ),
      RequestPoint(
        point: Point(
          latitude: state.toAddress!.latitude,
          longitude: state.toAddress!.longitude,
        ),
        requestPointType: RequestPointType.wayPoint,
      ),
    ];

    final resultWithSession = YandexDriving.requestRoutes(
      points: [
        ...points,
      ],
      drivingOptions: const DrivingOptions(
        initialAzimuth: 0,
        routesCount: 1,
        avoidTolls: true,
      ),
    );

    for (int i = 0; i < points.length; i++) {
      if (i == points.length - 1) {
        break;
      }
      DrivingResultWithSession? requestRoute = YandexDriving.requestRoutes(
        points: [
          points[i],
          points[i + 1],
        ],
        drivingOptions: const DrivingOptions(
          initialAzimuth: 0,
          routesCount: 1,
          avoidTolls: true,
        ),
      );
      DrivingSessionResult? result = await requestRoute.result;
      addressDistanceTimeModels.add(
        AddressDistanceTimeModel(
          distance: result.routes!.first.metadata.weight.distance.text,
          time: result.routes!.first.metadata.weight.time.text,
        ),
      );
      requestRoute = null;
      result = null;
    }

    if (!mounted) return;
    await context.pushNamed(
      Routes.calculateRoute,
      extra: CalculateRoutePageArguments(
        addressDistanceTimeModels: addressDistanceTimeModels,
        addAdditionalAddresses: [
          state.fromAddress!,
          ...state.addAdditionalAddresses,
          state.toAddress!,
        ],
        result: resultWithSession.result,
        session: resultWithSession.session,
        startPlaceMark: PlacemarkMapObject(
          mapId: const MapObjectId('start_placemark'),
          point: Point(
            latitude: state.fromAddress!.latitude,
            longitude: state.fromAddress!.longitude,
          ),
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                PngImage.startPoint,
              ),
            ),
          ),
        ),
        additionalPlaceMarks: state.addAdditionalAddresses
            .map(
              (address) => PlacemarkMapObject(
                mapId: MapObjectId(address.latitude.toString()),
                point: Point(
                  latitude: address.latitude,
                  longitude: address.longitude,
                ),
                opacity: 1,
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                      PngImage.additionalPoint,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        endPlaceMark: PlacemarkMapObject(
          mapId: const MapObjectId('end_placemark'),
          point: Point(
            latitude: state.toAddress!.latitude,
            longitude: state.toAddress!.longitude,
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
      ),
    );
  }
}
