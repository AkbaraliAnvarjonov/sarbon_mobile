import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class CustomStepWidget extends StatelessWidget {
  const CustomStepWidget({
    super.key,
    required this.status,
    required this.isLast,
    required this.isFirst,
    required this.onTap,
    required this.isSelected,
  });

  final String status;
  final bool isLast;
  final bool isFirst;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.kGap16,
            Row(
              children: [
                Text(
                  status.tr(),
                  style: context.textStyle.regularSubheadline,
                ),
                AppUtils.kSpacer,
                if (isLast)
                  SvgPicture.asset(
                    SvgImage.icBoxDelivery,
                    height: 28,
                    width: 28,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? context.colorScheme.primary
                          : context.color.midGrey5,
                      BlendMode.srcIn,
                    ),
                  )
                else if (isSelected)
                  Material(
                    color: context.colorScheme.primary,
                    borderRadius: AppUtils.kBorderRadius8,
                    child: CircleAvatar(
                      backgroundColor: context.colorScheme.primary,
                      radius: 12,
                      child: Icon(
                        Icons.check,
                        size: 18,
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  )
                else
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius8,
                      border: Border.all(
                        color: context.color.greyText,
                      ),
                    ),
                  ),
              ],
            ),
            AppUtils.kGap16,
            AppUtils.kDivider,
          ],
        ),
      );
}
