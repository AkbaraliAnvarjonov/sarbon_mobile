part of 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;
  Map<String, dynamic> queryParameters = {'project-id': Constants.projectId};

  @override
  Future<SendCodeResponseModel> sendCode(
    SendCodeRequestModel sendCodeRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + TableSlugs.sendCode,
        data: jsonEncode(sendCodeRequestModel.toJson()),
        options: Constants.requestOptions,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SendCodeResponseModel.fromJson(response.data);
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
  Future<CheckUserResponseModel> checkUser(
    CheckUserRequestModel sendCodeRequestModel,
  ) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.users,
        options: Constants.requestOptions.copyWith(
          headers: {
            // 'environment-id': '11b59b25-8772-456a-84e1-20bdfdd32506',
            // 'resource-id': 'e32ba3ac-a552-4e42-a3c9-04e3ac1a4ac3',
            'Authorization': 'API-KEY',
            'X-API-KEY': Constants.apiKey,
          },
        ),
        queryParameters: sendCodeRequestModel.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CheckUserResponseModel.fromJson(response.data);
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
  Future<bool> verifyOtp(
    VerifyOtpRequestModel verifyOtpRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        '${Constants.authUrl}${TableSlugs.verifyOtp}',
        data: verifyOtpRequestModel.toJson(),
        options: Constants.requestOptions.copyWith(
          headers: {
            'environment-id': '11b59b25-8772-456a-84e1-20bdfdd32506',
            'resource-id': 'e32ba3ac-a552-4e42-a3c9-04e3ac1a4ac3',
            'Authorization': 'API-KEY',
            'X-API-KEY': Constants.apiKey,
          },
        ),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // ignore: avoid_dynamic_calls
        if (response.data['data'] is String) {
          return true;
        } else {
          // ignore: avoid_dynamic_calls
          if (response.data['data']['user_id'] != null) {
            // ignore: avoid_dynamic_calls
            final String userId = response.data['data']['user_id'];
            await localSource.setUserId(userId);
          }
          return false;
        }
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
  Future<RegisterDriverResponseModel> registerDriver(
    RegisterDriverRequestModel registerDriverRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + TableSlugs.register,
        data: registerDriverRequestModel.toJson(),
        options: Constants.requestOptions,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterDriverResponseModel.fromJson(response.data);
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
  Future<RegisterOperatorResponseModel> registerOperator(
    RegisterOperatorRequestModel registerOperatorRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + TableSlugs.register,
        data: registerOperatorRequestModel.toJson(),
        options: Constants.requestOptions,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterOperatorResponseModel.fromJson(response.data);
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
  Future<RegisterSocialResponseModel> registerSocial(
    RegisterSocialRequestModel registerSocialRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        '${Constants.baseUrl}${Urls.openFunction}/${TableSlugs.logistikaGetCurrentLocation}',
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {'object_data': registerSocialRequestModel.toJson()}
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterSocialResponseModel.fromJson(response.data);
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
  Future<LoginResponseModel> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + TableSlugs.login,
        data: loginRequestModel.toJson(),
        options: Constants.requestOptions,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponseModel.fromJson(response.data);
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
  Future<GetClientTypeResponseModel> getClientType(
    GetClientTypeRequestModel clientTypeRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + TableSlugs.getClientTypeId,
        data: clientTypeRequestModel.toJson(),
        options: Constants.requestOptions,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetClientTypeResponseModel.fromJson(response.data);
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
  Future<GetCompaniesResponseModel> getCompaniesForRegistration(
    Map<String, dynamic> request,
  ) async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.firm,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'project-id': Constants.projectId,
          'data': jsonEncode(
            {
              'offset': 0,
              'limit': 20,
              'company_direction': ['logistic_company'],
            },
          ),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetCompaniesResponseModel.fromJson(response.data);
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
  Future<bool> putFcmToken({
    required String fcmToken,
    required String loginId,
    required String userId,
    required String registerId,
  }) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.users,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'guid': localSource.userId,
            'fcm_token': fcmToken,
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

  @override
  Future<bool> putUserPassword({required String password}) async {
    try {
      final Response response = await dio.put(
        Constants.baseUrl + Urls.v2Items + TableSlugs.users,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'guid': localSource.userId,
            'password': password,
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

  @override
  Future<UserAgreementResponse> fetchUserAgreement() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.directory,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode(
            {
              'status': ['politeka_confidentiality'],
            },
          ),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserAgreementResponse.fromJson(response.data);
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
  Future<List<TrailerTypeResponse>> getTrailerTypes() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.objectSlim + TableSlugs.vehicleType,
        options: Constants.requestOptionsWithoutIds,
        queryParameters: {
          'data': jsonEncode({}),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (response.data['data']['data']['response'] as List).map((e) => TrailerTypeResponse.fromJson(e)).toList();
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
  Future<bool> checkRegisterUser({required String phoneNumber}) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.openFunction + TableSlugs.logistikaSendOfferFromCustomer,
        options: Constants.requestOptionsWithoutIds,
        data: {
          'data': {
            'object_data': {
              'email': '',
              'phone': phoneNumber,
              'type': 'register',
              'register_type': "phone",
            },
          },
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UserCheckModel.fromJson(response.data).data.data.response.isEmpty ? true : false;
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
