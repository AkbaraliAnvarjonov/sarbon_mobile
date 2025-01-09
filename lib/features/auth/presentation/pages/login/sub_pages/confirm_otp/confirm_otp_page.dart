part of '../forgot_password/forgot_password_page.dart';

class _ConfirmOtpPage extends StatelessWidget {
  const _ConfirmOtpPage({
    required this.pageController,
    required this.phoneNumber,
    required this.pinPutController,
    required this.defaultPinTheme,
    required this.pinPutFocusNode,
  });

  final PageController pageController;
  final String phoneNumber;
  final TextEditingController pinPutController;
  final PinTheme defaultPinTheme;
  final FocusNode pinPutFocusNode;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvoked: (value) async {
          await pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listenWhen: (previous, current) =>
              previous.verifyOtpStatus != current.verifyOtpStatus,
          listener: (context, state) async {
            if (state.verifyOtpStatus.isSuccess) {
              await pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (state.verifyOtpStatus.isError) {
              pinPutController.clear();
            } else if (state.verifyOtpStatus.isUserFoundError) {
              await showDialog<void>(
                context: context,
                builder: (_) => const _OtpErrorDialogWidget(),
              ).then(
                (value) => pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              );
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
                  await pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            body: ModalProgressHUD(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: Text(
                      'confirm_code'.tr(),
                      style: context.textStyle.headline,
                    ),
                  ),
                  AppUtils.kGap8,
                  _SendMessageTextWidget(phoneNumber: phoneNumber),
                  AppUtils.kGap40,
                  Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: Text(
                      'sms_code'.tr(),
                      style: context.textStyle.size14Weight400Black,
                    ),
                  ),
                  AppUtils.kGap6,
                  _PinPutOtpWidget(
                    pinPutController: pinPutController,
                    defaultPinTheme: defaultPinTheme,
                    pinPutFocusNode: pinPutFocusNode,
                  ),
                  AppUtils.kSpacer,
                  const Center(
                    child: _TimerWidget(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _ConfirmButtonWidget(
              pinPutController: pinPutController,
            ),
          ),
        ),
      );
}
