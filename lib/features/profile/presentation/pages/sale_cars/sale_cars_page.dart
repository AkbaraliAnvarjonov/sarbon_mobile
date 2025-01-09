import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';

class SaleCarsPage extends StatelessWidget {
  const SaleCarsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('sale_car'.tr())),
        body: Padding(
          padding: AppUtils.kPaddingVertical16,
          child: Material(
            color: context.colorScheme.surface,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Theme(
                  data: ThemeData(
                    listTileTheme: ListTileThemeData(
                      horizontalTitleGap: 8,
                      tileColor: context.colorScheme.surface,
                    ),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      SvgImage.icTruck,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        context.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: context.color.greyText,
                    ),
                    title: Text(
                      'want_to_buy'.tr(),
                      style: context.textStyle.size15Weight600Black,
                    ),
                    onTap: () async {
                      await context.pushNamed(Routes.searchSaleCars);
                    },
                  ),
                ),
                const Padding(
                  padding: AppUtils.kPaddingHorizontal16,
                  child: AppUtils.kDivider,
                ),
                Theme(
                  data: ThemeData(
                    listTileTheme: ListTileThemeData(
                      horizontalTitleGap: 8,
                      tileColor: context.colorScheme.surface,
                    ),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      SvgImage.icFilePlus,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        context.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: context.color.greyText,
                    ),
                    title: Text(
                      'my_advertisements'.tr(),
                      style: context.textStyle.size15Weight600Black,
                    ),
                    onTap: () async {
                      await context.pushNamed(Routes.myAnnouncement);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
