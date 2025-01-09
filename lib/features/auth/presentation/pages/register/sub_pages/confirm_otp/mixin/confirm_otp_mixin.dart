part of '../confirm_otp_page.dart';

mixin ConfirmOtpMixin on State<ConfirmOtpPage> {
  late final TextEditingController pinPutController;
  late final FocusNode pinPutFocusNode;
  late PinTheme defaultPinTheme;

  void initControllers() {
    pinPutController = TextEditingController();
    pinPutFocusNode = FocusNode();
    defaultPinTheme = const PinTheme();
  }

  void disposeControllers() {
    pinPutController.dispose();
    pinPutFocusNode.dispose();
  }
}
