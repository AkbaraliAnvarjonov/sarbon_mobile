import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extension/extension.dart';
import '../../utils/utils.dart';

typedef Validator = String? Function(String?);
typedef OnChanged = void Function(String);
typedef OnFieldSubmitted = void Function(String);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.cursorColor,
    this.enabled = true,
    this.obscure = false,
    this.showError = false,
    this.readOnly = false,
    this.maxLines,
    this.fillColor,
    this.textInputFormatter,
    this.textInputAction = TextInputAction.done,
    this.nextFocusNode,
    required this.hintText,
    this.hintTextStyle,
    this.errorText,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.prefixTextStyle,
    this.suffixTextStyle,
    this.prefixText,
    this.suffixText,
    this.labelTextStyle,
    this.labelText,
    this.labelInTextField = false,
    this.contentPadding,
    this.cursorHeight,
    this.onFieldSubmitted,
    this.maxLength,
    this.autoValidateMode,
    this.showBorder = true,
    this.onTap,
    this.showEnabledBorder = false,
    this.enabledBorder,
    this.style,
  });

  final TextEditingController? controller;
  final Validator? validator;
  final OnChanged? onChanged;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextCapitalization textCapitalization;
  final Color? cursorColor;
  final bool enabled;
  final int? maxLines;
  final Color? fillColor;
  final bool obscure;
  final bool? showError;
  final bool? readOnly;
  final TextInputFormatter? textInputFormatter;
  final TextInputAction textInputAction;
  final String hintText;
  final TextStyle? hintTextStyle;
  final String? errorText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextStyle? prefixTextStyle;
  final TextStyle? suffixTextStyle;
  final TextStyle? labelTextStyle;
  final String? labelText;
  final String? prefixText;
  final String? suffixText;
  final bool labelInTextField;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final OnFieldSubmitted? onFieldSubmitted;
  final int? maxLength;
  final AutovalidateMode? autoValidateMode;
  final bool showBorder;
  final VoidCallback? onTap;
  final bool showEnabledBorder;
  final OutlineInputBorder? enabledBorder;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (labelText != null && !labelInTextField)
            Text(
              labelText!,
              style: labelTextStyle ??
                  context.textStyle.size14Weight500Black.copyWith(
                    color: context.color.gray700,
                  ),
            ),
          if (labelText != null && !labelInTextField) AppUtils.kGap6,
          TextFormField(
            autovalidateMode: autoValidateMode,
            key: key,
            style: style ?? context.textStyle.regularCallout,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            keyboardType: textInputType,
            focusNode: focusNode,
            textCapitalization: textCapitalization,
            cursorColor: cursorColor ?? context.colorScheme.primary,
            enableInteractiveSelection: true,
            obscureText: obscure,
            readOnly: readOnly ?? false,
            enabled: enabled,
            textInputAction: textInputAction,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            onTap: onTap,
            onEditingComplete: () {
              if (nextFocusNode != null) {
                nextFocusNode?.requestFocus();
              } else {
                focusNode?.unfocus();
              }
            },
            onFieldSubmitted: (value) {
              if (onFieldSubmitted != null) {
                onFieldSubmitted?.call(value);
              }
              if (nextFocusNode != null) {
                nextFocusNode?.requestFocus();
              } else {
                focusNode?.unfocus();
              }
            },
            inputFormatters: textInputFormatter != null ? [textInputFormatter!] : null,
            decoration: InputDecoration(
              counterStyle: context.textStyle.size14Weight400Black.copyWith(
                color: context.color.greyText,
              ),
              fillColor: fillColor ?? context.colorScheme.surface,
              labelText: labelInTextField ? labelText : null,
              labelStyle: labelTextStyle,
              hintText: hintText,
              hintStyle: hintTextStyle ??
                  context.textStyle.regularCallout.copyWith(
                    color: context.color.greyText,
                  ),
              contentPadding: contentPadding ?? AppUtils.kPaddingHorizontal14,
              suffix: suffix,
              suffixIcon: suffixIcon,
              prefix: prefix,
              prefixIcon: prefixIcon,
              prefixText: prefixText,
              prefixStyle: prefixTextStyle,
              suffixText: suffixText,
              suffixStyle: suffixTextStyle,
              errorText: (showError ?? false) ? errorText : null,
              errorStyle: context.textStyle.regularCaption1.copyWith(
                color: context.colorScheme.error,
              ),
              enabledBorder: enabledBorder ??
                  (showEnabledBorder
                      ? OutlineInputBorder(
                          borderRadius: AppUtils.kBorderRadius12,
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.12),
                          ),
                        )
                      : null),
              focusedBorder: (readOnly ?? false) || !showBorder
                  ? null
                  : OutlineInputBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                      borderSide: BorderSide(
                        color: context.colorScheme.primary,
                      ),
                    ),
              focusedErrorBorder: showBorder
                  ? const OutlineInputBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                      borderSide: BorderSide(color: Colors.red),
                    )
                  : null,
              errorBorder: showBorder
                  ? const OutlineInputBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                      borderSide: BorderSide(color: Colors.red),
                    )
                  : null,
            ),
            cursorHeight: cursorHeight,
          ),
        ],
      );
}
