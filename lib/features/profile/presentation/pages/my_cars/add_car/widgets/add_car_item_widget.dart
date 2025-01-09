import 'package:flutter/material.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';

class AddUpdateCarItemWidget extends StatelessWidget {
  const AddUpdateCarItemWidget({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
    this.onChanged,
    this.isSwitchButton = false,
  });

  final String title;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onChanged;
  final bool? isSwitchButton;
  final bool value;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.colorScheme.onPrimary,
          ),
          child: Padding(
            padding: AppUtils.kPaddingHor12Ver16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textStyle.regularSubheadline.copyWith(
                    color: context.color.textColor,
                  ),
                ),
                if (isSwitchButton ?? false)
                  SizedBox(
                    height: 18,
                    width: 32,
                    child: Switch.adaptive(
                      value: value,
                      activeColor: context.colorScheme.primary,
                      onChanged: (value) {
                        onChanged!(value);
                      },
                    ),
                  )
                else
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius4,
                        color: value
                            ? context.colorScheme.primary
                            : context.color.lightGrey5,
                        border: value
                            ? null
                            : Border.all(
                                color: context.color.midGrey5,
                              ),
                      ),
                      child: value
                          ? Icon(
                              Icons.check,
                              size: 12,
                              color: context.colorScheme.onPrimary,
                            )
                          : null,
                    ),
                  ),
              ],
            ),
          ),
        ),
  );
}
