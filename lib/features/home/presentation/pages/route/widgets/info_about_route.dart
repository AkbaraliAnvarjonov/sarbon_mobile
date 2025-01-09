import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';

class InfoAboutRoute extends StatelessWidget {
  const InfoAboutRoute({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'add_route'.tr(),
              style: context.textStyle.appBarTitle,
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap12,
            Text(
              'explanation_of_the_route'.tr(),
              style: context.textStyle.regularFootnote,
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap24,
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('it_is_clear'.tr()),
            ),
          ],
        ),
      );
}
