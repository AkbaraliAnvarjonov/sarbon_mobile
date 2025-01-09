import 'package:flutter/material.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/theme/themes.dart';
import '../../../../../../../core/utils/utils.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.isActive,
    required this.isDone,
    required this.title,
    required this.number,
  });

  final bool isActive;
  final bool isDone;
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: context.colorScheme.primary, shape: BoxShape.circle),
            child: isDone
                ? Icon(Icons.check, color: context.colorScheme.surface)
                : Padding(
                    padding: AppUtils.kPaddingAll8,
                    child: Text(
                      number,
                      style: context.textStyle.size15Weight500Black
                          .copyWith(color: context.colorScheme.surface, fontSize: 16),
                    ),
                  ),
          ),
          AppUtils.kGap8,
          Text(
            title,
            style: context.textStyle.regularHeadline.copyWith(
              color: isActive ? context.colorScheme.primary : context.colorScheme.onSurface,
            ),
          ),
        ],
      );
}
