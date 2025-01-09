import 'package:dio/dio.dart';
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
}
