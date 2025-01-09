part of 'orders_remote_data_source.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  OrdersRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<GetOrdersResponseModel> getOrders({
    required List<String> ordersType,
    required int limit,
    required int offset,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.order,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode({
            'provisions': ordersType,
            'users_id': localSource.userId,
            'with_relations': true,
          }),
          'limit': limit,
          'offset': offset,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetOrdersResponseModel.fromJson(response.data);
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
  Future<GetOrderDetailsResponseModel> getOrderDetails({
    required String guid,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.order,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode({
            'with_relations': true,
            'guid': guid,
          }),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetOrderDetailsResponseModel.fromJson(response.data);
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
  Future putOrderStatuses({
    required List<String> statuses,
    required String orderId,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.order,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'indicate_status': statuses,
            'guid': orderId,
          },
        },
        queryParameters: {
          'project-id': Constants.projectId,
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
  Future postRatingReviews({
    required RatingReviewRequestModel request,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.v2Items + TableSlugs.review,
        options: Constants.requestOptionsWithoutIds,
        data: request.toJson(),
        queryParameters: {
          'project-id': Constants.projectId,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        unawaited(
          dio.post(
            Constants.baseUrl + Urls.openFunction + TableSlugs.calculateUserRating,
            options: Constants.requestOptionsWithoutIds,
            data: request.toJsonOpenFunc(response.data['data']['data']['data']['guid']),
            queryParameters: {
              'project-id': Constants.projectId,
            },
          ),
        );
        unawaited(
          dio.put(
            Constants.baseUrl + Urls.v2Items + TableSlugs.users,
            options: Constants.requestOptionsWithoutIds,
            data: {
              'data': {
                'guid': localSource.userId,
                'provisions': ['empty']
              }
            },
            queryParameters: {
              'project-id': Constants.projectId,
            },
          ),
        );
        return response.data;
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
  Future putOrder({
    required List<String> status,
    List<String>? whoCancellation,
    required String orderId,
    required String carType,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.order,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'provisions': status,
            'guid': orderId,
            'car_type': carType,
            if (whoCancellation != null) 'who_cancellation': whoCancellation, // ['driver'],
          },
        },
        queryParameters: {
          'project-id': Constants.projectId,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }

  @override
  Future acceptUser({
    required String provisions,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.users,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'guid': localSource.userId,
            'provisions': [provisions]
          },
        },
        queryParameters: {
          'project-id': Constants.projectId,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }

  @override
  Future<GetDetailAddressesResponse> getAddresses({
    required GetAddressesRequest getAddressesRequest,
  }) async {
    try {
      final Response response = await dio.post(
        '${Constants.baseUrl}${Urls.openFunction}/${TableSlugs.logistikaSendListOfAddressName}',
        options: Constants.requestOptionsWithoutIds,
        data: getAddressesRequest.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetDetailAddressesResponse.fromJson(response.data);
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
  Future<FetchAddressPositionResponse> fetchAddressesPositions({
    required FetchAddressPositionRequest fetchAddressPositionRequest,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.period,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(fetchAddressPositionRequest.toJson()),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return FetchAddressPositionResponse.fromJson(response.data);
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
  Future<bool> putNewOrderStatuses({
    required String orderId,
    required num acceptedOffers,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.openFunction + TableSlugs.logistikaCheckCargoStatus,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'object_data': {
              'cargo_id': orderId,
              'accepted_offers': acceptedOffers,
              'driver_id': localSource.userId,
            },
          },
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
}
