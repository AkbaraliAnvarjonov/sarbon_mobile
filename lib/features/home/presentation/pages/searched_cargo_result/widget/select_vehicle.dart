import 'package:flutter/material.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../../../../../core/utils/utils.dart';

class SelectVehicleWidget extends StatelessWidget {
  const SelectVehicleWidget({
    super.key,
    this.onTap,
    this.info,
    this.trailing,
    required this.title,
  });

  final VoidCallback? onTap;
  final String? info;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => GestureDetector(
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
              Expanded(
                child: Text(
                  (info?.isNotEmpty ?? false) ? (info ?? '') : title,
                  style: context.textStyle.regularCallout.copyWith(
                    color: context.color.textColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              AppUtils.kSpacer,
              Icon(
                Icons.navigate_next_outlined,
                size: 22,
                color: context.color.gray700,
              ),
              AppUtils.kGap20,
            ],
          ),
        ),
      );
}
