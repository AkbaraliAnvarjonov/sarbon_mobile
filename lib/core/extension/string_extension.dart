part of 'extension.dart';

extension StringCutter on String {
  String cutString(int maxLength) {
    if (length > maxLength) {
      return '${substring(0, maxLength)}...';
    } else {
      return this;
    }
  }

  String checkStringLength(int maxLength) {
    // Find the position of the first comma
    int commaIndex = indexOf(',');

    // If no comma is found, return the whole string (as there's no comma)
    if (commaIndex == -1) {
      return this;
    }

    // If the length of the string up to the first comma is greater than maxLength
    if (commaIndex > maxLength) {
      return substring(0, maxLength);
    }

    // Otherwise, return the substring up to the first comma
    return substring(0, commaIndex);
  }

  String get afterFirstComma {
    // Find the position of the first comma
    int commaIndex = indexOf(',');

    // If no comma is found, return an empty string
    if (commaIndex == -1) {
      return '';
    }

    // Return the substring after the first comma
    return substring(commaIndex + 1).trim();
  }
}
