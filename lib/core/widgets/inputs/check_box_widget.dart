import 'package:flutter/material.dart';

import '../../extension/extension.dart';
import '../../utils/utils.dart';

class CheckBoxWidgetRight extends StatelessWidget {
  const CheckBoxWidgetRight({
    super.key,
    required this.onTap,
    required this.title,
    this.value = false,
  });

  final bool value;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingVertical16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textStyle.regularSubheadline.copyWith(
                color: context.color.textColor,
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Ink(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius4,
                  color: value ? context.colorScheme.primary : context.color.lightGrey5,
                  border: value
                      ? null
                      : Border.all(
                          color: context.color.midGrey5,
                        ),
                ),
                child: value
                    ? Icon(
                        Icons.check,
                        size: 18,
                        color: context.colorScheme.onPrimary,
                      )
                    : null,
              ),
            ),
          ],
        ),
      );
}
