import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    required this.labelText,
    required this.onChanged,
    this.onTap,
    this.showError = false,
    this.obscureText = false,
    this.formatter,
    this.textInputType,
    this.prefixText,
    this.prefixTextStyle,
    this.borderColor,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String labelText;
  final ValueChanged<String> onChanged;
  final VoidCallback? onTap;
  final bool? showError;
  final bool? obscureText;
  final TextInputFormatter? formatter;
  final TextInputType? textInputType;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) => Container(
        padding: AppUtils.kPaddingHor12Ver8,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          border: Border.all(
            color: (showError ?? false)
                ? context.color.red
                : context.color.borderColor,
          ),
          color: context.colorScheme.onPrimary,
        ),
        child: TextField(
          onTap: onTap,
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText ?? false,
          style: context.textStyle.regularSubheadline,
          onChanged: onChanged,
          inputFormatters: formatter != null ? [formatter!] : null,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: AppUtils.kPaddingZero,
            labelText: labelText,
            floatingLabelStyle: context.textStyle.regularFootnote.copyWith(
              color: (showError ?? false)
                  ? context.color.red
                  : context.color.greyText,
            ),
            labelStyle: context.textStyle.regularSubheadline.copyWith(
              color: context.color.greyText,
            ),
            fillColor: context.colorScheme.onPrimary,
            prefixText: prefixText,
            prefixStyle: prefixTextStyle,
            focusColor: context.colorScheme.primary,
          ),
        ),
      );
}
