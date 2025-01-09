import 'package:sarbon_mobile/features/auth/domain/entities/check_user/check_user_request_entity.dart';

import '../../../../core/either/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../data/data_source/local/auth_local_data_source.dart';
import '../../data/data_source/remote/auth_remote_data_source.dart';
import '../../data/models/registration/driver/trailer_type_response.dart';
import '../../data/models/verify_otp/verify_otp_request_model.dart';
import '../entities/check_user/check_user_response_entity.dart';
import '../entities/login/get_client_type_request_entity.dart';
import '../entities/login/get_client_type_response_entity.dart';
import '../entities/login/get_companies_response_entity.dart';
import '../entities/login/login_request_entity.dart';
import '../entities/login/login_response_entity.dart';
import '../entities/registration/driver/register_driver_request_entity.dart';
import '../entities/registration/driver/register_driver_response_entity.dart';
import '../entities/registration/driver/trailer_type_response_entity.dart';
import '../entities/registration/operator/register_operator_request_entity.dart';
import '../entities/registration/operator/register_operator_response_entity.dart';
import '../entities/send_code/send_code_request_entity.dart';
import '../entities/send_code/send_code_response_entity.dart';
import '../entities/user_agreement/user_agreement_entity.dart';

part '../../data/repository/auth_repository_impl.dart';

sealed class AuthRepository {
  Future<Either<Failure, RegisterDriverResponseEntity>> registerDriver(
    RegisterDriverRequestEntity requestEntity,
  );

  Future<Either<Failure, RegisterOperatorResponseEntity>> registerOperator(
    RegisterOperatorRequestEntity requestEntity,
  );

  Future<Either<Failure, GetCompaniesResponseEntity>> getCompaniesForRegistration(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, GetClientTypeResponseEntity>> getClientTypeId(
    GetClientTypeRequestEntity requestEntity,
  );

  Future<Either<Failure, LoginResponseEntity>> login(
    LoginRequestEntity requestEntity,
  );

  Future<Either<Failure, SendCodeResponseEntity>> sendCodeOtp({
    required SendCodeRequestEntity requestEntity,
  });

  Future<Either<Failure, CheckUserResponseEntity>> checkUser({
    required CheckUserRequestEntity requestEntity,
  });

  Future<Either<Failure, bool>> verifyOtp({
    required VerifyOtpRequestModel requestEntity,
  });

  Future<Either<Failure, bool>> putFcmToken({
    required String fcmToken,
    required String loginId,
    required String userId,
    required String registerId,
  });

  Future<Either<Failure, bool>> putUserPassword({
    required String password,
  });

  Future<Either<Failure, UserAgreementEntity>> fetchUserAgreement();

  Future<Either<Failure, TrailerTypeResponseEntity>> getTrailerType();
}
