part of 'extension.dart';

extension StringCutter on String {
  String cutString(int maxLength) {
    if (length > maxLength) {
      return '${substring(0, maxLength)}...';
    } else {
      return this;
    }
  }
}
