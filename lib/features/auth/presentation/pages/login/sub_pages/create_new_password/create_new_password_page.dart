part of '../forgot_password/forgot_password_page.dart';

class _CreateNewPasswordPage extends StatefulWidget {
  const _CreateNewPasswordPage({
    required this.pageController,
    required this.createNewPasswordController,
    required this.confirmPasswordController,
    required this.createNewPasswordFocusNode,
    required this.confirmPasswordFocusNode,
    required this.formKey,
  });

  final PageController pageController;
  final TextEditingController createNewPasswordController;
  final TextEditingController confirmPasswordController;
  final FocusNode createNewPasswordFocusNode;
  final FocusNode confirmPasswordFocusNode;
  final GlobalKey<FormState> formKey;

  @override
  State<_CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<_CreateNewPasswordPage> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvoked: (value) async {
          await widget.pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listenWhen: (previous, current) =>
              previous.putUserPasswordStatus != current.putUserPasswordStatus,
          listener: (context, state) {
            if (state.putUserPasswordStatus.isSuccess) {
              context.goNamed(Routes.login);
            }
          },
          child: Scaffold(
            backgroundColor: context.colorScheme.onPrimary,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                ),
                onPressed: () async {
                  await widget.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            body: Form(
              key: widget.formKey,
              child: ModalProgressHUD(
                inAsyncCall: context.select(
                  (ForgotPasswordBloc bloc) =>
                      bloc.state.putUserPasswordStatus.isLoading,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: AppUtils.kPaddingAll16,
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Text(
                              'create_password'.tr(),
                              style: context.textStyle.size15Weight600Black
                                  .copyWith(
                                fontSize: 28,
                              ),
                            ),
                            AppUtils.kGap24,
                            CustomTextField(
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'enter_new_password'.tr();
                                } else if (value != null && value.length < 8) {
                                  return 'password_error'.tr();
                                }
                                return null;
                              },
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: widget.createNewPasswordController,
                              focusNode: widget.createNewPasswordFocusNode,
                              obscure: isObscurePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: context.color.greyText,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscurePassword = !isObscurePassword;
                                  });
                                },
                              ),
                              labelText: 'enter_new_password'.tr(),
                              hintText: 'think_it_over'.tr(),
                              showEnabledBorder: true,
                            ),
                            AppUtils.kGap24,
                            CustomTextField(
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'confirm_new_password'.tr();
                                } else if (value != null &&
                                    value !=
                                        widget
                                            .createNewPasswordController.text) {
                                  return 'passwords_do_not_match'.tr();
                                }
                                return null;
                              },
                              obscure: isObscureConfirmPassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscureConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: context.color.greyText,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscureConfirmPassword =
                                        !isObscureConfirmPassword;
                                  });
                                },
                              ),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: widget.confirmPasswordController,
                              focusNode: widget.confirmPasswordFocusNode,
                              labelText: 'confirm_new_password'.tr(),
                              hintText: 'think_it_over'.tr(),
                              showEnabledBorder: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _ContinueButtonCreatePasswordWidget(
              formKey: widget.formKey,
              confirmPasswordController: widget.confirmPasswordController,
            ),
          ),
        ),
      );
}
