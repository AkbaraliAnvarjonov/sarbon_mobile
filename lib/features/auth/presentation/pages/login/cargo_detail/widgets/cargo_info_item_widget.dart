import 'package:flutter/material.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';

class CargoInfoItemWidget extends StatelessWidget {
  const CargoInfoItemWidget({
    super.key,
    required this.title,
    required this.info,
    required this.isLastItem,
    this.infoColor,
  });

  final String title;
  final String info;
  final Color? infoColor;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) => Padding(
        padding: isLastItem ? AppUtils.kPaddingZero : AppUtils.kPaddingBottom4,
        child: RichText(
          text: TextSpan(
            text: title,
            children: [
              TextSpan(
                text: info,
                style: context.textStyle.size14Weight400Black.copyWith(
                  color: infoColor ?? context.color.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            style: context.textStyle.size14Weight400Black.copyWith(
              color: context.color.midGray.withOpacity(0.8),
            ),
          ),
        ),
      );
}
