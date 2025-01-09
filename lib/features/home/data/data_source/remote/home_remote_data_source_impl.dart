part of 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<GetNewsResponseModel> getAllNews({
    required int limit,
    required int offset,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.news,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode({}),
          'limit': limit,
          'offset': offset,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetNewsResponseModel.fromJson(response.data);
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
  Future<GetAddressesResponseModel> getAddresses({
    required int limit,
    required int offset,
    String? searchedText,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.city,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': searchedText?.isNotEmpty ?? false
              ? jsonEncode({
                  'view_fields': ['name_ru', 'name_en', 'name', 'city'],
                  'search': searchedText,
                  'with_relations': true,
                })
              : jsonEncode({
                  'view_fields': ['name', 'city'],
                  'with_relations': true,
                }),
          'limit': 500,
          'offset': offset,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetAddressesResponseModel.fromJson(response.data);
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
  Future<GetSearchedCargoItemsResponseModel> getSearchedCargoItems({
    required GetSearchedCargoItemsRequestModel request,
    required int limit,
    required int offset,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.cargoItems,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode(request.toJson()),
          'limit': limit,
          'offset': offset,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetSearchedCargoItemsResponseModel.fromJson(response.data);
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
  Future<GetCargoDetailsResponseModel> getCargoDetails({
    required String guid,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.cargoItems,
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
        return GetCargoDetailsResponseModel.fromJson(response.data);
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
  Future<GetVehicleTypesResponseModel> getVehicleTypes({
    required int limit,
    required int offset,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.vehicle,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode(
            {
              'with_relations': true,
              'users_id': localSource.userId,
              'status': ['active'],
              'car_position': ['alive'],
            },
          ),
          'limit': limit,
          'offset': offset,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetVehicleTypesResponseModel.fromJson(response.data);
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
  Future putOppositeOffer({
    required PutOppositeOfferRequestModel requestModel,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.v2Items + TableSlugs.order,
        options: Constants.requestOptionsWithoutIds,
        data: requestModel.toJson(),
        queryParameters: {
          'project-id': Constants.projectId,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }

  @override
  Future postOppositeOffer({required String orderId}) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.openFunction,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'function_id': Constants.functionId,
          'object_ids': [orderId],
        },
        queryParameters: {
          'project-id': Constants.projectId,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
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
  Future<CargoPointAddressesResponse> getAddressesPoint({
    required CargoPointsAddressesRequest request,
  }) async {
    try {
      final Response response = await dio.post(
        '${Constants.baseUrl}${Urls.openFunction}/${TableSlugs.logistikaSendListOfAddressName}',
        options: Constants.requestOptionsWithoutIds,
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CargoPointAddressesResponse.fromJson(response.data);
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
  Future<bool> createRoute({required CreateRouteRequest request}) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.v2Items + TableSlugs.route,
        options: Constants.requestOptionsWithoutIds,
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
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
  Future<FetchRoutesResponse> fetchRoutes({
    required FetchRoutesRequest request,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.route,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {'data': jsonEncode(request.toJson())},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return FetchRoutesResponse.fromJson(response.data);
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
  Future<bool> deleteRoute({required String routeId}) async {
    try {
      final Response response = await dio.delete(
        '${Constants.baseUrl}${Urls.v2Items}${TableSlugs.route}/$routeId',
        options: Constants.requestOptionsWithoutIds,
        data: {'data': <dynamic, dynamic>{}},
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
  Future<bool> updateRoute({required UpdateRouteRequest request}) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.route,
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
  Future<NotificationResponse> fetchNotifications({
    required NotificationRequest request,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.note,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(request.toJson()),
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return NotificationResponse.fromJson(response.data);
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
  Future<bool> putNotification({
    required PutNotificationRequest request,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.note,
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
  Future<bool> putFavouriteCargo({
    required PutFavouriteRequestHome request,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.users,
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
  Future<TypesCargoResponse> fetchCargoTypes() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.cargoType,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode({}),
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return TypesCargoResponse.fromJson(response.data);
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
  Future<TypesPaymentResponse> fetchPaymentTypes() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.map,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode({}),
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return TypesPaymentResponse.fromJson(response.data);
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
  Future<GetSearchedCargoItemsResponseModel> fetchCargoFromFilter({
    required ApplyFilterRequest request,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.cargoItems,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(request.toJson()),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetSearchedCargoItemsResponseModel.fromJson(response.data);
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
  Future<FetchCurrencyResponse> fetchCurrency() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.currency,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode({}),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return FetchCurrencyResponse.fromJson(response.data);
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
  Future<GetOrderByNotificationResponseModel> getOrderDetailsByNotification({
    required String guid,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.orders,
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
        return GetOrderByNotificationResponseModel.fromJson(response.data);
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
  Future<GetDetailAddressesByNotification> getAddressesByNotification({
    required GetAddressesRequestByNotification getAddressesRequest,
  }) async {
    try {
      final Response response = await dio.post(
        '${Constants.baseUrl}${Urls.openFunction}/${TableSlugs.logistikaSendListOfAddressName}',
        options: Constants.requestOptionsWithoutIds,
        data: getAddressesRequest.toJson(),
        queryParameters: {
          'project-id': Constants.projectId,
          'use_no_limit': false,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetDetailAddressesByNotification.fromJson(response.data);
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
  Future<FetchAddressPositionNotificationResponse> fetchAddressesPositionsNotification({
    required FetchAddressPositionNotificationRequest fetchAddressPositionRequest,
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
        return FetchAddressPositionNotificationResponse.fromJson(response.data);
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
  Future<bool> putOrderByNotification({
    required List<String> status,
    required String orderId,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.response,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'provisions': status,
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
  Future<FetchAddressPositionCargoResponse> fetchAddressesPositionsCargo({
    required FetchAddressPositionCargoRequest fetchAddressPositionRequest,
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
        return FetchAddressPositionCargoResponse.fromJson(response.data);
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
  Future<GetSearchedCargoItemsResponseModel> getAllCargos({
    required int limit,
    required int offset,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.cargoItems,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode({
            'vehicle_type_id': localSource.vehicleId,
            'cargo_type': ['cargo'],
            'with_relations': true,
            'order_status': ['active'],
          }),
          'limit': limit,
          'offset': offset,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetSearchedCargoItemsResponseModel.fromJson(response.data);
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
  Future<GetSearchedCargoItemsResponseModel> getAllCargosWithoutFilter({
    required int limit,
    required int offset,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.cargoItems,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode({
            'cargo_type': ['cargo'],
            'with_relations': true,
            'order_status': ['active'],
          }),
          'limit': limit,
          'offset': offset,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetSearchedCargoItemsResponseModel.fromJson(response.data);
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
