part of 'main_remote_data_source.dart';

class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  MainRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<bool> putTracking({required TrackingForApiRequest request}) async {
    try {
      final Response response = await dio.post(
        '${Constants.baseUrl}${Urls.openFunction}/${TableSlugs.logistikaDriverGpsTracking}',
        options: Constants.requestOptionsWithoutIds,
        data: request.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }

  @override
  Future<bool> putLatLong({required TrackingForApiRequest request}) async {
    try {
      final Response response = await dio.post(
        '${Constants.baseUrl}${Urls.openFunction}/${TableSlugs.logistikaGetCurrentLocation}',
        options: Constants.requestOptionsWithoutIds,
        data: request.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }

  @override
  Future<bool> postSignedUserLocation({required PostSignedRequest request}) async {
    try {
      final Response response = await dio.post(
        '${Constants.baseUrl}${Urls.v2Items}${TableSlugs.gpsHistory}',
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': request.toJson(),
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }

  @override
  Future<String> getDispatcherId() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.dispatcherDrivers,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(
            {
              'users_id': localSource.userId,
            },
          ),
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return DispatcherModel.fromJson(response.data).data.data.response.firstOrNull?.usersId2 ?? '';
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }
}
