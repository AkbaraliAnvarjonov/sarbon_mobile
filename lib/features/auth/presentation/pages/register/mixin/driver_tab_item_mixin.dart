import 'package:flutter/material.dart';

mixin DriverTabItemMixin {
  late TextEditingController nameController;
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late FocusNode nameFocusNode;
  late FocusNode loginFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  void initControllers() {
    /// TextControllers
    nameController = TextEditingController();
    loginController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    /// FocusNodes
    nameFocusNode = FocusNode();
    loginFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  void disposeControllers() {
    nameController.dispose();
    loginController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocusNode.dispose();
    loginFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }
}
