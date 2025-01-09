part of '../driver_register_page.dart';

class _BottomButtonsWidget extends StatelessWidget {
  const _BottomButtonsWidget({
    required this.formKey,
    required this.nameController,
    required this.loginController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppUtils.kPaddingHorizontal4,
              child: Row(
                children: [
                  BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
                    buildWhen: (previous, current) => previous.isUserAgreement != current.isUserAgreement,
                    builder: (context, state) => Checkbox(
                      value: state.isUserAgreement,
                      onChanged: (value) {
                        context.read<ConfirmationUserBloc>().add(
                              const UserAgreementChangedEvent(),
                            );
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'by_clicking_button_you_accept_terms_and_conditions'.tr(),
                        style: context.textStyle.regularCaption1.copyWith(
                          color: context.color.gray700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await context.pushNamed(Routes.userAgreement);
                        },
                        child: Text(
                          'user_agreement'.tr(),
                          style: context.textStyle.regularCaption1.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppUtils.kPaddingAll16,
              child: BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
                buildWhen: (previous, current) => previous.isUserAgreement != current.isUserAgreement,
                builder: (context, state) => ElevatedButton(
                  onPressed: state.isUserAgreement && state.selectedTypeItem != null
                      ? () async {
                          if (formKey.currentState!.validate()) {
                            late final LocationPermissionHandle result;
                            result = await LocationMixin.instance.hasPermission();

                            if (result == LocationPermissionHandle.locationEnabled) {
                              if (!context.mounted) return;
                              await customModalBottomSheet<void>(
                                context: context,
                                builder: (_, controller) => const LocationBottomSheet(),
                              );
                            }

                            context.read<ConfirmationUserBloc>().add(
                                  RegisterDriverEvent(
                                    RegisterDriverRequestEntity(
                                      fullName: nameController.text.trim(),
                                      login: loginController.text.trim(),
                                      password: passwordController.text.trim(),
                                      phone: '+998${state.phoneNumber.replaceAll(' ', '').trim()}',
                                      registerId: '',
                                      fcmToken: '',
                                      clientTypeId: Constants.clientTypeDriverId,
                                      roleId: Constants.roleDriverId,
                                      vehicleId: state.selectedTypeItem!.guid,
                                      // companyId: state.selectedCompany!.guid,
                                      photo: 'photo',
                                      passportScan: '',
                                      passportCode: '',
                                      residenceRegistration: '',
                                      driverLicense: '',
                                    ),
                                  ),
                                );
                          }
                        }
                      : null,
                  child: Text('continue'.tr()),
                ),
              ),
            ),
          ],
        ),
      );
}
