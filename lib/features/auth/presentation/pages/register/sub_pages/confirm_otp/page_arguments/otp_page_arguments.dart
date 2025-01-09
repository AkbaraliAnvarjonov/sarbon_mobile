import 'package:flutter/cupertino.dart';

class ConfirmOtpPageArguments {
  final String phoneNumber;
  final PageController pageController;

  ConfirmOtpPageArguments({
    required this.phoneNumber,
    required this.pageController,
  });
}
