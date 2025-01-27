part of 'confirmation_user_bloc.dart';

class ConfirmationUserState extends Equatable {
  const ConfirmationUserState({
    this.isValidPhoneNumber = false,
    this.getSmsIdStatus = ApiStatus.initial,
    this.verifyOtpStatus = ApiStatus.initial,
    this.checkUserStatus = ApiStatus.initial,
    this.socialStatus = ApiStatus.initial,
    this.phoneNumber = '',
    this.otp = '',
    this.selectedRole,
    this.companies = const [],
    this.trailerTypes = const [],
    this.getCompaniesStatus = ApiStatus.initial,
    this.selectedTypeItem,
    this.isUserAgreement = false,
    this.registerStatus = ApiStatus.initial,
    this.errorText = '',
  });

  final bool isValidPhoneNumber;
  final ApiStatus getSmsIdStatus;
  final ApiStatus socialStatus;
  final ApiStatus checkUserStatus;
  final ApiStatus verifyOtpStatus;
  final String phoneNumber;
  final String otp;
  final UserRole? selectedRole;
  final List<TrailerTypeItem> trailerTypes;
  final List<CompanyItem> companies;
  final ApiStatus getCompaniesStatus;
  final TrailerTypeItem? selectedTypeItem;
  final bool isUserAgreement;
  final ApiStatus registerStatus;
  final String errorText;

  ConfirmationUserState copyWith({
    bool? isValidPhoneNumber,
    ApiStatus? getSmsIdStatus,
    ApiStatus? checkUserStatus,
    ApiStatus? socialStatus,
    ApiStatus? verifyOtpStatus,
    String? phoneNumber,
    String? otp,
    UserRole? selectedRole,
    List<CompanyItem>? companies,
    List<TrailerTypeItem>? trailerTypes,
    ApiStatus? getCompaniesStatus,
    TrailerTypeItem? selectedTypeItem,
    bool? isUserAgreement,
    ApiStatus? registerStatus,
    String? errorText,
  }) =>
      ConfirmationUserState(
        isValidPhoneNumber: isValidPhoneNumber ?? this.isValidPhoneNumber,
        getSmsIdStatus: getSmsIdStatus ?? this.getSmsIdStatus,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        socialStatus: socialStatus ?? this.socialStatus,
        verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
        checkUserStatus: checkUserStatus ?? ApiStatus.initial,
        otp: otp ?? this.otp,
        selectedRole: selectedRole ?? this.selectedRole,
        companies: companies ?? this.companies,
        getCompaniesStatus: getCompaniesStatus ?? this.getCompaniesStatus,
        selectedTypeItem: selectedTypeItem ?? this.selectedTypeItem,
        isUserAgreement: isUserAgreement ?? this.isUserAgreement,
        registerStatus: registerStatus ?? this.registerStatus,
        errorText: errorText ?? this.errorText,
        trailerTypes: trailerTypes ?? this.trailerTypes,
      );

  @override
  List<Object?> get props => [
        isValidPhoneNumber,
        getSmsIdStatus,
        phoneNumber,
        checkUserStatus,
        socialStatus,
        verifyOtpStatus,
        otp,
        selectedRole,
        companies,
        getCompaniesStatus,
        selectedTypeItem,
        isUserAgreement,
        registerStatus,
        errorText,
        trailerTypes,
      ];
}
