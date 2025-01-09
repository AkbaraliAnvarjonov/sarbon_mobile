import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/mixins/location_mixin.dart';
import '../../../../router/app_routes.dart';
import '../../../orders/domain/usecases/get_orders_usecase.dart';
import '../../data/data_source/main_remote_data_source.dart';
import '../../data/model/tracking/post_signed_request.dart';
import '../../data/model/tracking/tracking_request.dart';

part 'main_state.dart';

part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    // required this.putTrackingUseCase,
    required this.getOrdersUseCase,
    required this.mainRemoteDataSource,
  }) : super(const MainState()) {
    on<MainEventChanged>(_onChangeMenu);
    on<PutTrackingEvent>(_putTracking);
    on<FetchSignedOrdersCountMainEvent>(_getSignedOrders);
    on<PutLatLongEvent>(_putLatLong);
  }

  final GetOrdersUseCase getOrdersUseCase;
  final MainRemoteDataSource mainRemoteDataSource;
  final Battery battery = Battery();

  Future<void> _putTracking(
    PutTrackingEvent event,
    Emitter<MainState> emit,
  ) async {
    final Position position = await Geolocator.getCurrentPosition();
    final PostSignedRequest request = PostSignedRequest(
      lat: position.latitude,
      long: position.longitude,
      usersId: localSource.userId,
      currentTime: DateTime.now().toString(),
      gpsTime: DateTime.now().toString(),
      orderId: event.orderId,
    );
    unawaited(mainRemoteDataSource.postSignedUserLocation(request: request));
  }

  Future<void> _putLatLong(
    PutLatLongEvent event,
    Emitter<MainState> emit,
  ) async {
    final permission = await LocationMixin.instance.onlyCheck();
    if (permission == LocationPermissionHandle.success) {
      final Position position = await Geolocator.getCurrentPosition();

      await mainRemoteDataSource.putLatLong(
        request: TrackingForApiRequest(
          data: Data(
            objectData: ObjectData(
              driverLastSeen: [
                jsonEncode(
                  TrackingRequest(
                    userId: localSource.userId,
                    lat: position.latitude,
                    long: position.longitude,
                    updateTime: DateTime.now().toString(),
                    os: Platform.isAndroid ? 'android' : 'ios',
                    version: '${packageInfo.version} ${packageInfo.buildNumber}',
                    battery: kDebugMode ? 75 : await battery.batteryLevel,
                    gps: (await LocationMixin.instance.hasPermission()) == LocationPermissionHandle.success,
                    // DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
                  ).toJson(),
                ),
              ],
            ),
          ),
        ),
      );
    }
    await Future.delayed(const Duration(seconds: 20), () async {
      add(const PutLatLongEvent());
    });
  }

  void _onChangeMenu(MainEventChanged event, Emitter<MainState> emit) {
    emit(state.copyWith(bottomMenu: event.menu));
  }

  Future<void> _getSignedOrders(
    FetchSignedOrdersCountMainEvent event,
    Emitter<MainState> emit,
  ) async {
    final response = await getOrdersUseCase(
      const GetOrdersParams(
        ordersType: ['performed'],
        limit: 5,
        offset: 0,
      ),
    );
    response.fold(
      (l) {},
      (r) {
        emit(
          state.copyWith(
            signedOrderCount: r.count,
            orderId: r.orders.firstOrNull?.guid ?? '',
          ),
        );
      },
    );
  }
}

enum BottomMenu {
  home,
  routes,
  orders,
  profile,
}
