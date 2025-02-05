import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sarbon_mobile/features/main/data/model/dispatcher/dispatcher_model.dart';
import 'package:sarbon_mobile/router/app_routes.dart';
import '../../../../constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../model/tracking/post_signed_request.dart';
import '../model/tracking/tracking_request.dart';

part 'main_remote_data_source_impl.dart';

abstract class MainRemoteDataSource {
  Future<bool> putTracking({
    required TrackingForApiRequest request,
  });

  Future<bool> putLatLong({
    required TrackingForApiRequest request,
  });

  Future<bool> postSignedUserLocation({
    required PostSignedRequest request,
  });

  Future<String> getDispatcherId();
}
