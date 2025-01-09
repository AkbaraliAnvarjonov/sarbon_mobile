part of '../../forgot_password/forgot_password_page.dart';

mixin CreateNewPasswordMixin on State<ForgotPasswordPage> {
  late final TextEditingController createNewPasswordController;
  late final TextEditingController confirmPasswordController;
  late final FocusNode createNewPasswordFocusNode;
  late final FocusNode confirmPasswordFocusNode;
  final GlobalKey<FormState> formKeyCreatePassword = GlobalKey<FormState>();

  void initControllersCreateNewPassword() {
    createNewPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    createNewPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  void disposeControllersCreateNewPassword() {
    createNewPasswordController.dispose();
    confirmPasswordController.dispose();
    createNewPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }
}
