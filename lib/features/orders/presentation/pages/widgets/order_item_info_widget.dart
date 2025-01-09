import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class OrderItemInfoWidget extends StatelessWidget {
  const OrderItemInfoWidget({
    super.key,
    required this.type,
    required this.info,
  });

  final String type;
  final String info;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: RichText(
          text: TextSpan(
            text: '$type: ',
            children: [
              TextSpan(
                text: info,
                style: context.textStyle.size14Weight400Black.copyWith(
                  color: context.color.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            style: context.textStyle.size14Weight400Black.copyWith(
              color: context.color.greyText,
            ),
          ),
        ),
      );
}
