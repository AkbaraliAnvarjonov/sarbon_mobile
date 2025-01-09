import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('contact_with_us'.tr()),
              AppUtils.kGap24,
              GestureDetector(
                onTap: () async {
                  await UrlLauncher.switchPhoneNumber('+998941201212');
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: AppUtils.kBorderRadius12,
                  ),
                  child: Icon(
                    Icons.phone,
                    color: context.colorScheme.onError,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
