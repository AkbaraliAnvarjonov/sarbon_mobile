import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sarbon_mobile/features/auth/data/models/check_user/check_user_request_model.dart';
import 'package:sarbon_mobile/features/auth/data/models/check_user/check_user_response_model.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../router/app_routes.dart';
import '../../models/login/get_client_type_request_model.dart';
import '../../models/login/get_client_type_response_model.dart';
import '../../models/login/get_companies_response_model.dart';
import '../../models/login/login_request_model.dart';
import '../../models/login/login_response_model.dart';
import '../../models/registration/driver/register_driver_request_model.dart';
import '../../models/registration/driver/register_driver_response_model.dart';
import '../../models/registration/driver/register_social_model.dart';
import '../../models/registration/driver/register_social_response.dart';
import '../../models/registration/driver/trailer_type_response.dart';
import '../../models/registration/operator/register_operator_request_model.dart';
import '../../models/registration/operator/register_operator_response_model.dart';
import '../../models/send_code/send_code_request_model.dart';
import '../../models/send_code/send_code_response_model.dart';
import '../../models/user_agreement/user_agreement_response.dart';
import '../../models/verify_otp/verify_otp_request_model.dart';

part 'auth_remote_data_source_impl.dart';

abstract class AuthRemoteDataSource {
  Future<SendCodeResponseModel> sendCode(
    SendCodeRequestModel sendCodeRequestModel,
  );

  Future<CheckUserResponseModel> checkUser(
    CheckUserRequestModel sendCodeRequestModel,
  );

  Future<bool> verifyOtp(
    VerifyOtpRequestModel verifyOtpRequestModel,
  );

  Future<GetCompaniesResponseModel> getCompaniesForRegistration(
    Map<String, dynamic> request,
  );

  Future<RegisterDriverResponseModel> registerDriver(
    RegisterDriverRequestModel registerDriverRequestModel,
  );

  Future<RegisterSocialResponseModel> registerSocial(
    RegisterSocialRequestModel registerSocialRequestModel,
  );

  Future<RegisterOperatorResponseModel> registerOperator(
    RegisterOperatorRequestModel registerOperatorRequestModel,
  );

  Future<GetClientTypeResponseModel> getClientType(
    GetClientTypeRequestModel clientTypeRequestModel,
  );

  Future<LoginResponseModel> login(
    LoginRequestModel loginRequestModel,
  );

  Future<bool> putFcmToken({
    required String fcmToken,
    required String loginId,
    required String userId,
    required String registerId,
  });

  Future<bool> putUserPassword({
    required String password,
  });

  Future<UserAgreementResponse> fetchUserAgreement();

  Future<List<TrailerTypeResponse>> getTrailerTypes();
}
