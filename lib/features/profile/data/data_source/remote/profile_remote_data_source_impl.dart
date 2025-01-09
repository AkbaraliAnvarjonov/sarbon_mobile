part of 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<GetUserCarsResponseModel> getUserCars({
    required int limit,
    required int offset,
    required String userId,
    required List<String> status,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.vehicle,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode({
            'with_relations': true,
            'users_id': userId,
            'status': status,
          }),
          'limit': limit,
          'offset': offset,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetUserCarsResponseModel.fromJson(response.data);
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
  Future<GetCargoTypesResponseModel> getCargoTypes() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.cargoType,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {'data': jsonEncode({})},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetCargoTypesResponseModel.fromJson(response.data);
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
  Future<bool> checkVehicleNumber({required String vehicleNumber}) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.vehicle,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(
            {
              "offset": 0,
              "order": {},
              "search": vehicleNumber,
              "limit": 1000,
              "view_fields": ["car_number"]
            },
          )
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (response.data['data']['data']['response'] as List<dynamic>).isEmpty;
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
  Future<GetLoadTypesResponseModel> getLoadTypes() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.loadType,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {'data': jsonEncode({})},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetLoadTypesResponseModel.fromJson(response.data);
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
  Future<GetTrailerTypesResponseModel> getTrailerTypes() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.trailerType,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {'data': jsonEncode({})},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetTrailerTypesResponseModel.fromJson(response.data);
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
  Future<GetTrailerTypesResponseModel> getFuelTypes() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.fuel,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {'data': jsonEncode({})},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetTrailerTypesResponseModel.fromJson(response.data);
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
  Future createCar({required CreateUpdateCarRequestModel request}) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.v2Items + TableSlugs.vehicle,
        options: Constants.requestOptionsWithoutIds,
        data: request.toJson(),
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
  Future<GetUserInfoResponseModel> getUserInfo({
    required String userId,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.users,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode({'guid': userId}),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetUserInfoResponseModel.fromJson(response.data);
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
  Future<RecommendationCarsResponse> getRecommendationCars({
    required RecommendationCarsRequest request,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.carSale,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(request.toJson()),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RecommendationCarsResponse.fromJson(response.data);
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
  Future<CarsSaleSearchResponse> getSaleCarsSearchResult({
    required CarsSaleSearchRequest request,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.carSale,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(request.toJson()),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CarsSaleSearchResponse.fromJson(response.data);
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
  Future<TypeCarsResponse> getTypeCars() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.vehicleType,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode({}),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return TypeCarsResponse.fromJson(response.data);
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
  Future<TypeCurrencyResponse> getTypeCurrency() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.currency,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode({}),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return TypeCurrencyResponse.fromJson(response.data);
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
  Future<GetAddressesResponse> getAddresses() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.city,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(
            {
              'with_relations': true,
            },
          ),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetAddressesResponse.fromJson(response.data);
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
  Future<bool> createAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.v2Items + TableSlugs.carSale,
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
  Future<GetActiveInActiveAnnouncementResponse> getActiveAnnouncement({
    required GetActiveAnnouncementRequest request,
  }) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.carSale,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(request.toJson()),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetActiveInActiveAnnouncementResponse.fromJson(response.data);
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
  Future<bool> updateAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.carSale,
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
  Future<bool> updateCar({
    required CreateUpdateCarRequestModel request,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.vehicle,
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
  Future<bool> deleteCar({required String carId}) async {
    try {
      final Response response = await dio.delete(
        '${Constants.baseUrl}${Urls.v2Items}${TableSlugs.vehicle}/$carId',
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
  Future<FavouriteCargoResponse> fetchFavouriteCargo({
    required FavouriteCargoRequest request,
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
        return FavouriteCargoResponse.fromJson(response.data);
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
  Future<bool> putFavouriteCargo({required PutFavouriteRequest request}) async {
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
  Future<ReferenceBookResponse> fetchReferenceBook() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.directory,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(
            {
              'status': ['directory'],
            },
          ),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ReferenceBookResponse.fromJson(response.data);
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
  Future<bool> createComplain({required CreateComplainRequest request}) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.v2Items + TableSlugs.complain,
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
  Future<bool> putUserInfo({required PutUserInfoRequest request}) async {
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
  Future<bool> deleteUser({required String userId}) async {
    try {
      final Response response = await dio.delete(
        '${Constants.baseUrl}${Urls.v2Items}${TableSlugs.users}/$userId',
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
}
