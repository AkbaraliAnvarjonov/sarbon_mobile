import 'package:flutter/material.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../../../../core/utils/utils.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    this.onTap,
    this.subTitle,
    this.icon,
    this.trailing,
    required this.title,
    this.isDateItem = false,
  });

  final VoidCallback? onTap;
  final String? subTitle;
  final String? icon;
  final String title;
  final bool isDateItem;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subTitle?.isNotEmpty ?? false)
            Text(
              title,
              style: context.textStyle.size14Weight500Black.copyWith(
                color: const Color(0xFF211F26),
              ),
            ),
          AppUtils.kGap6,
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius8,
                color: context.color.bg2,
                border: Border.all(color: const Color(0xFFDADADA)),
              ),
              child: Row(
                children: [
                  AppUtils.kGap20,
                  Text(
                    (subTitle?.isNotEmpty ?? false) ? (subTitle ?? '') : title,
                    style: context.textStyle.regularCallout.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                  AppUtils.kSpacer,
                  Container(
                    height: 56,
                    width: 64,
                    decoration: const BoxDecoration(
                      borderRadius: AppUtils.kBorderRightRadius8,
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(color: Color(0xFFDADADA)),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: context.color.gray700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
