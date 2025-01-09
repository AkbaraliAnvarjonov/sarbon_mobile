import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.text,
    this.onTap,
    required this.icon,
    this.isTop = false,
    this.isBottom = false,
    this.isExist = true,
    this.isVisible = true,
  });

  final String icon;
  final String text;
  final VoidCallback? onTap;
  final bool isTop;
  final bool isBottom;
  final bool isExist;
  final bool isVisible;

  @override
  Widget build(BuildContext context) => ListTile(
        horizontalTitleGap: 8,
        contentPadding: AppUtils.kPaddingHor12Ver4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isTop ? 12 : 0),
            topRight: Radius.circular(isTop ? 12 : 0),
            bottomLeft: Radius.circular(isBottom ? 12 : 0),
            bottomRight: Radius.circular(isBottom ? 12 : 0),
          ),
        ),
        onTap: onTap,
        leading: Opacity(
          opacity: isExist ? 1 : 0.3,
          child: Padding(
            padding: AppUtils.kPaddingAll4,
            child: SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
              color: context.colorScheme.primary,
            ),
          ),
        ),
        title: Row(
          children: [
            Opacity(
              opacity: isExist ? 1 : 0.3,
              child: Text(
                text,
                style: context.textStyle.size15Weight500Black,
              ),
            ),
            if (!isExist) AppUtils.kGap8,
            if (!isExist)
              Container(
                padding: AppUtils.kPaddingHor8Ver4,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  color: context.color.green.withOpacity(0.2),
                ),
                child: Text(
                  'Скоро',
                  style: context.textStyle.size13Weight500Black.copyWith(
                    color: context.color.green,
                  ),
                ),
              ),
          ],
        ),
        trailing: isVisible
            ? Opacity(
                opacity: isExist ? 1 : 0.3,
                child: SvgPicture.asset(
                  SvgImage.icChevronRight,
                ),
              )
            : null,
      );
}
