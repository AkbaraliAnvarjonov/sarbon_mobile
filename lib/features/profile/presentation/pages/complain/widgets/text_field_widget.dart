import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';

class ComplainTextFieldWidget extends StatelessWidget {
  const ComplainTextFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.onChanged,
    this.showError = false,
    this.obscureText = false,
    this.formatter,
    this.textInputType,
    this.prefixText,
    this.prefixTextStyle,
    this.borderColor,
    this.maxLines,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final ValueChanged<String> onChanged;
  final bool? showError;
  final bool? obscureText;
  final TextInputFormatter? formatter;
  final TextInputType? textInputType;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final Color? borderColor;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Container(
        padding: AppUtils.kPaddingAll12,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
        ),
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText ?? false,
          style: context.textStyle.regularSubheadline,
          onChanged: onChanged,
          inputFormatters: formatter != null ? [formatter!] : null,
          keyboardType: textInputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: AppUtils.kPaddingZero,
            labelText: labelText,
            floatingLabelStyle: context.textStyle.regularFootnote.copyWith(
              fontSize: 16,
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
