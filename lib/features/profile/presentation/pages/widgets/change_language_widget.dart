import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppUtils.kPaddingHorizontal16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'app_language'.tr(),
                    style: context.textStyle.appBarTitle,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            AppUtils.kGap12,
            ListTile(
              title: Text(
                'O\'zbekcha',
                style: context.textStyle.regularCallout,
              ),
              onTap: () async {
                context.setLocale(const Locale('uz'));
                await localSource.setLocale('uz').then((value) {
                  if (!context.mounted) return;
                  context.pop();
                });
              },
              trailing: context.locale.languageCode == 'uz'
                  ? Icon(
                      Icons.check,
                      color: context.colorScheme.primary,
                    )
                  : null,
            ),
            // AppUtils.kDivider,
            // ListTile(
            //   title: Text(
            //     'Ўзбекча',
            //     style: context.textStyle.regularCallout,
            //   ),
            //   onTap: () async {
            //     context.setLocale(const Locale('oz', 'UZ'));
            //     await localSource.setLocale('oz').then((value) {
            //       if (!context.mounted) return;
            //       print('mana keyingi til');
            //       print(context.locale);
            //       context.pop();
            //     });
            //   },
            //   trailing: context.locale.languageCode == 'oz'
            //       ? Icon(
            //           Icons.check,
            //           color: context.colorScheme.primary,
            //         )
            //       : null,
            // ),
            AppUtils.kDivider,
            ListTile(
              title: Text(
                'Русский',
                style: context.textStyle.regularCallout,
              ),
              onTap: () async {
                context.setLocale(const Locale('ru'));
                await localSource.setLocale('ru').then((value) {
                  if (!context.mounted) return;
                  context.pop();
                });
              },
              trailing: context.locale.languageCode == 'ru'
                  ? Icon(
                      Icons.check,
                      color: context.colorScheme.primary,
                    )
                  : null,
            ),
          ],
        ),
      );
}
