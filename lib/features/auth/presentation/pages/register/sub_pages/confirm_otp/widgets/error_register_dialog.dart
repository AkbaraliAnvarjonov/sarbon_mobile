import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../../../../../../../core/utils/utils.dart';

class ErrorRegisterDialog extends StatelessWidget {
  const ErrorRegisterDialog({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
        child: Container(
          padding: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('error'.tr(), textAlign: TextAlign.center),
              AppUtils.kGap12,
              Text(
                'this_phone_number_was_previously_registered'.tr(),
                style: context.textStyle.size14Weight400Black,
                textAlign: TextAlign.center,
              ),
              AppUtils.kGap12,
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('try_again'.tr()),
              ),
            ],
          ),
        ),
      );
}
