part of '../operator_register_page.dart';

class _BottomButtonsWidget extends StatelessWidget {
  const _BottomButtonsWidget({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.loginController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
          builder: (context, state) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: AppUtils.kPaddingHorizontal4,
                child: Row(
                  children: [
                    Checkbox(
                      splashRadius: 0,
                      value: state.isUserAgreement,
                      onChanged: (value) {
                        context.read<ConfirmationUserBloc>().add(
                              const UserAgreementChangedEvent(),
                            );
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'by_clicking_button_you_accept_terms_and_conditions'
                              .tr(),
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
                child: ElevatedButton(
                  onPressed: state.isUserAgreement
                      ? () {
                          if (formKey.currentState!.validate()) {
                            context.read<ConfirmationUserBloc>().add(
                                  RegisterOperatorEvent(
                                    RegisterOperatorRequestEntity(
                                      fullName: nameController.text.trim(),
                                      companyId: '',
                                      login: loginController.text.trim(),
                                      password: passwordController.text.trim(),
                                      email: emailController.text.trim(),
                                      phone:
                                          '+998${state.phoneNumber.replaceAll(' ', '').trim()}',
                                      clientTypeId:
                                          Constants.clientTypeOperatorId,
                                      roleId: Constants.roleOperatorId,
                                      photo: 'photo',
                                      passportScan: 'photo_passport',
                                      passportCode: '',
                                      residenceRegistration: '',
                                      driverLicense: '',
                                      fcmToken: '',
                                      registerId: '',
                                    ),
                                  ),
                                );
                          }
                        }
                      : null,
                  child: Text('continue'.tr()),
                ),
              ),
            ],
          ),
        ),
      );
}
