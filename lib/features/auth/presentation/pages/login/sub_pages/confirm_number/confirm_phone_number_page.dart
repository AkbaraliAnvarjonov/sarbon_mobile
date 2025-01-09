part of '../forgot_password/forgot_password_page.dart';

class _ConfirmPhoneNumberPage extends StatelessWidget {
  const _ConfirmPhoneNumberPage({
    required this.pageController,
    required this.formKey,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) =>
      BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.getSmsIdStatus != current.getSmsIdStatus,
        listener: (context, state) async {
          if (state.getSmsIdStatus.isSuccess) {
            await pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else if (state.getSmsIdStatus.isError) {
            await showDialog<void>(
              context: context,
              builder: (_) => const _ConfirmNumberErrorDialog(),
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: Form(
            key: formKey,
            child: ModalProgressHUD(
              inAsyncCall: context.select(
                (ForgotPasswordBloc bloc) =>
                    bloc.state.getSmsIdStatus.isLoading,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: AppUtils.kPaddingAll16,
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Text(
                            'forgot_password'.tr(),
                            style:
                                context.textStyle.size15Weight600Black.copyWith(
                              fontSize: 28,
                            ),
                          ),
                          AppUtils.kGap24,
                          Text(
                            'we_will_send_confirmation_code_to_your_number'
                                .tr(),
                            style: context.textStyle.regularBody.copyWith(
                              color: context.color.grey400,
                            ),
                          ),
                          // AppUtils.kGap16,
                          // const _SelectUserRoleWidget(),
                          AppUtils.kGap24,
                          CustomTextField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'enter_phone_number'.tr();
                              } else if (value != null && value.length < 12) {
                                return 'error_phone_number'.tr();
                              }
                              return null;
                            },
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            hintText: 'enter_phone_number'.tr(),
                            labelText: 'phone_number'.tr(),
                            onChanged: (value) {
                              context.read<ForgotPasswordBloc>().add(
                                    SetPhoneNumberEvent(
                                      phoneNumber: value,
                                    ),
                                  );
                            },
                            // controller: _phoneNumberController,
                            textInputFormatter: MaskedTextInputFormatter(
                              mask: '00 000 00 00',
                              separator: ' ',
                              filter: RegExp('[0-9]'),
                            ),
                            fillColor: Colors.transparent,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: AppUtils.kBorderRadius12,
                              borderSide: BorderSide(
                                color: Color(0xff626FFF),
                              ),
                            ),
                            textInputType: TextInputType.number,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    PngImage.icFlag,
                                    width: 28,
                                    height: 18,
                                  ),
                                  AppUtils.kGap8,
                                  Text(
                                    '+998',
                                    style: context.textStyle.regularCallout,
                                  ),
                                ],
                              ),
                            ),
                            prefixTextStyle:
                                context.textStyle.regularSubheadline,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _ContinueButtonWidget(
            formKey: formKey,
          ),
        ),
      );
}
