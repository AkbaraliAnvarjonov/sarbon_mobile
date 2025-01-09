part of 'extension.dart';

extension BuildContextExt on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  ThemeColors get color => theme.extension<ThemeColors>()!;

  ThemeTextStyles get textStyle => theme.extension<ThemeTextStyles>()!;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function(
    SnackBar snackBar,
  ) get showSnackBar => ScaffoldMessenger.of(this).showSnackBar;

  void fieldFocusChange(
    FocusNode? currentFocus,
    FocusNode? nextFocus,
  ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(this).requestFocus(nextFocus);
    }
  }

  AppOptions get options => AppOptions.of(this);

  void setLocale(Locale locale) {
    AppOptions.update(
      this,
      AppOptions.of(this).copyWith(locale: locale),
    );
  }

  void setThemeMode(ThemeMode themeMode) {
    AppOptions.update(
      this,
      AppOptions.of(this).copyWith(themeMode: themeMode),
    );
  }
}

extension LocalizationExtension on String {
  String tr({
    BuildContext? context,
    Map<String, String>? namedArgs,
  }) =>
      context == null
          ? AppLocalizations.instance.translate(this)
          : AppLocalizations.of(context).translate(this);
}
