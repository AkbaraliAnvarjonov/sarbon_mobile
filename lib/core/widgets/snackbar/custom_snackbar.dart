import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../extension/extension.dart';
import '../../utils/utils.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void showSuccessSnackBar({
    required BuildContext context,
    required String message,
    FlushbarPosition? position,
  }) =>
      Flushbar(
        maxWidth: MediaQuery.of(context).size.width,
        flushbarPosition: position ?? FlushbarPosition.TOP,
        icon: const Icon(
          Icons.check,
          size: 42,
          color: Color(0xFF22C348),
        ),
        message: message,
        messageColor: const Color(0xFF22C348),
        backgroundColor: const Color(0xFFF5FFF8),
        borderRadius: AppUtils.kBorderRadius12,
        borderColor: const Color(0xFF47D16C),
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(seconds: 2),
      ).show(context);

  static Future<void> showErrorSnackBar({
    required BuildContext context,
    required String message,
    int? duration,
    int? animationDuration,
    FlushbarPosition? position,
  }) async =>
      Flushbar(
        maxWidth: MediaQuery.of(context).size.width,
        flushbarPosition: position ?? FlushbarPosition.TOP,
        margin: AppUtils.kPaddingAll16,
        icon: const Icon(
          Icons.error,
          size: 42,
          color: Color(0xFFFAFAFA),
        ),
        message: message,
        messageColor: context.colorScheme.onPrimary,
        backgroundColor: const Color(0xFFDE706F),
        borderRadius: AppUtils.kBorderRadius12,
        borderColor: const Color(0xFFDE706F),
        duration: Duration(seconds: duration ?? 2),
        animationDuration: Duration(seconds: animationDuration ?? 2),
      ).show(context);
}
