import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../extension/extension.dart';
import '../../utils/utils.dart';

Future logOut(
  BuildContext context, {
  VoidCallback? onConfirm,
}) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => CupertinoAlertDialog(
        title: const Text(
          'Выйти',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: const Text(
          'Вы хотите выйти',
          maxLines: 2,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Нет',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: onConfirm,
            child: const Text(
              'Да',
              style: TextStyle(
                color: Colors.red,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
  return showDialog(
    context: context,
    builder: (_) => Dialog(
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: AppUtils.kBorderRadius12,
      ),
      insetPadding: AppUtils.kPaddingHorizontal24,
      child: Padding(
        padding: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Выйти',
              textAlign: TextAlign.center,
              style: context.textStyle.regularSubheadline,
            ),
            AppUtils.kGap6,
            Text(
              'Вы хотите выйти',
              textAlign: TextAlign.center,
              style: context.textStyle.regularFootnote.copyWith(
                color: context.color.darkGrey3,
              ),
              maxLines: 2,
            ),
            AppUtils.kGap12,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      maximumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 44),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 36),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        context.colorScheme.background,
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Нет',
                      style: context.textStyle.regularBody,
                    ),
                  ),
                ),
                AppUtils.kGap8,
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ButtonStyle(
                      maximumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 44),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 36),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        context.colorScheme.primary,
                      ),
                    ),
                    child: Text(
                      'Да',
                      style: context.textStyle.buttonStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
