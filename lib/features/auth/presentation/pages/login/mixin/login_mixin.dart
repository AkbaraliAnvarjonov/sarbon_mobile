part of '../login_page.dart';

mixin LoginMixin on State<LoginPage> {
  late TextEditingController usernameController;
  late FocusNode userNameFocus;
  late TextEditingController passwordController;
  late FocusNode passwordFocus;

  void initControllers() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    userNameFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  void disposeControllers() {
    usernameController.dispose();
    passwordController.dispose();
    userNameFocus.dispose();
    passwordFocus.dispose();
  }
}
