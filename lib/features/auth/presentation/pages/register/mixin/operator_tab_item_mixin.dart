import 'package:flutter/material.dart';

mixin OperatorTabItemMixin {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// FocusNodes
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode loginFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  void initControllers() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    loginController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    /// FocusNodes
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    loginFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    /// FocusNodes
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    loginFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }
}
