import 'package:flutter/services.dart';

class CarNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only uppercase letters and numbers
    final regExp = RegExp(r'^[A-Z0-9]*$');
    final String filteredText = newValue.text
        .toUpperCase()
        .replaceAllMapped(RegExp('[^A-Z0-9]'), (match) => ''); // Convert to uppercase and filter invalid characters

    if (regExp.hasMatch(filteredText)) {
      return TextEditingValue(
        text: filteredText,
        selection: newValue.selection.copyWith(
          baseOffset: filteredText.length,
          extentOffset: filteredText.length,
        ),
      );
    }

    // Return old value if input doesn't match
    return oldValue;
  }
}
