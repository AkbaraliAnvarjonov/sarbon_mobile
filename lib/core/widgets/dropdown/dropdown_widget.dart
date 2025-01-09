import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.hintText,
    required this.list,
    this.selectedItem,
    this.onChanged,
    required this.label,
  });

  final String? hintText;
  final List<dynamic> list;
  final dynamic selectedItem;
  final ValueChanged? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textStyle.size14Weight500Black.copyWith(
              color: context.color.gray700,
            ),
          ),
          AppUtils.kGap6,
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius12,
              color: context.colorScheme.onPrimary,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                isExpanded: true,
                hint: Text(
                  hintText ?? 'choose_vehicle'.tr(),
                  style: context.textStyle.regularSubheadline.copyWith(
                    color: context.color.greyText,
                  ),
                ),
                items: list
                    .map(
                      (dynamic item) => DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          // ignore: avoid_dynamic_calls
                          item is String ? item : item.name ?? '',
                          style: context.textStyle.size14Weight400Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                value: selectedItem,
                onChanged: onChanged,
                buttonStyleData: ButtonStyleData(
                  height: 48,
                  width: double.maxFinite,
                  padding: AppUtils.kPaddingHorizontal12,
                  decoration: BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius8,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  scrollPadding: AppUtils.kPaddingAll8,
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius12,
                    color: context.colorScheme.onPrimary,
                  ),
                  offset: const Offset(0, -8),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
