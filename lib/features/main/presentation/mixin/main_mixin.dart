part of '../pages/main_page.dart';

mixin MainMixin on State<MainPage> {
  late StreamSubscription<Position> positionStream;
  late NetworkInfo networkInfo = sl();
  late AppLifecycleState lifeCycleState = AppLifecycleState.resumed;
  late Timer _timer;
  late final MainBloc bloc;
  late TabController tabController;

  Future<void> initController(WidgetsBindingObserver observer) async {
    bloc = context.read<MainBloc>();
    if (!mounted) return;
    WidgetsBinding.instance.addObserver(observer);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!mounted) return;
    if (localSource.userId.isNotEmpty) {
      foregroundNotificationConfig();
      getUserCurrentLocation();
      getUserOrders();
      putUserLatLong();
    }
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        lifeCycleState = AppLifecycleState.resumed;
      case AppLifecycleState.inactive:
        lifeCycleState = AppLifecycleState.paused;
      case AppLifecycleState.paused:
        lifeCycleState = AppLifecycleState.paused;
      case AppLifecycleState.detached:
        lifeCycleState = AppLifecycleState.detached;
        positionStream.cancel();
      case AppLifecycleState.hidden:
        lifeCycleState = AppLifecycleState.hidden;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    positionStream
      ..pause()
      ..cancel();
    _timer.cancel();
    super.dispose();
  }

  void getUserOrders() {
    bloc.add(const FetchSignedOrdersCountMainEvent());
    Timer.periodic(const Duration(minutes: 4), (timer) {
      if (lifeCycleState == AppLifecycleState.resumed) {
        bloc.add(const FetchSignedOrdersCountMainEvent());
      }
    });
  }

  void backGroundGetUserOrders() {
    Timer.periodic(const Duration(minutes: 4), (timer) {
      if (lifeCycleState != AppLifecycleState.resumed) {
        bloc.add(const FetchSignedOrdersCountMainEvent());
      }
    });
  }

  void putUserLatLong() {
    Future.delayed(const Duration(seconds: 20), () {
      bloc.add(const PutLatLongEvent());
    });
  }

  Future<void> getUserCurrentLocation() async {
    late final LocationPermissionHandle result;
    startAndStop();
    await Future.delayed(const Duration(seconds: 3), () async {
      result = await LocationMixin.instance.hasPermission();
    });
    if (result == LocationPermissionHandle.locationEnabled) {
      if (!mounted) return;
      await customModalBottomSheet<void>(
        context: context,
        builder: (_, controller) => const LocationBottomSheet(),
      );
    }
  }

  Future<void> backGroundGetUserCurrentLocation() async {
    backGroundStartAndStop();
  }

  void startAndStop() {
    if (!mounted) return;
    _timer = Timer.periodic(
      const Duration(seconds: 60),
      (timer) async {
        if (localSource.hasProfile &&
            await networkInfo.isConnected &&
            bloc.state.signedOrderCount != 0 &&
            lifeCycleState == AppLifecycleState.resumed) {
          bloc.add(
            PutTrackingEvent(
              orderId: bloc.state.orderId,
            ),
          );
        }
        // }
      },
    );
  }

  void backGroundStartAndStop() {
    if (!mounted) return;
    _timer = Timer.periodic(
      const Duration(seconds: 60),
      (timer) async {
        if (localSource.hasProfile &&
            await networkInfo.isConnected &&
            bloc.state.signedOrderCount != 0 &&
            lifeCycleState != AppLifecycleState.resumed) {
          bloc.add(
            PutTrackingEvent(
              orderId: bloc.state.orderId,
            ),
          );
        }
      },
    );
  }

  void foregroundNotificationConfig() {
    late LocationSettings locationSettings;
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 100,
        useMSLAltitude: true,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 5),
        foregroundNotificationConfig: ForegroundNotificationConfig(
          enableWakeLock: true,
          notificationText: 'notification_text'.tr(),
          notificationTitle: 'Sarbon',
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 100,
      );
    }
    positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (position) async {
        if (localSource.hasProfile && await networkInfo.isConnected) {
          backGroundGetUserOrders();
          unawaited(backGroundGetUserCurrentLocation());
        }
      },
    );
  }
}
