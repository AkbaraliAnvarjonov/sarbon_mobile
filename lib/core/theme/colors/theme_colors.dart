part of 'package:sarbon_mobile/core/theme/themes.dart';

/// A set of colors for the entire app.
const colorLightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF26BD49),
  onPrimary: Colors.white,
  surface: Colors.white,
  onSurface: Color(0xFF020000),
  secondary: Color(0xFF69D7C7),
  onSecondary: Color(0xFF020000),
  error: Color(0xFFE30021),
  onError: Colors.white,
  surfaceVariant: Color(0xFFF5F5F5),
  background: Color(0xFFF3F6FB),
  onBackground: Color(0xFF020000),
);

///
const colorDarkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF26BD49),
  onPrimary: Colors.white,
  surface: Color(0xFFF7F9FC),
  onSurface: Color(0xFF020000),
  secondary: Color(0xFF69D7C7),
  onSecondary: Color(0xFF020000),
  error: Color(0xFFD93F2F),
  onError: Colors.white,
  background: Color(0xFFF3F6FB),
  onBackground: Color(0xFF020000),
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.lightBlue,
    required this.primary200,
    required this.main,
    required this.cardColor,
    required this.green,
    required this.lightGreen,
    required this.greenG100,
    required this.tealT800,
    required this.red,
    required this.lightGray,
    required this.middleGray,
    required this.midGray,
    required this.midGray2,
    required this.labelTextColor,
    required this.backgroundTabBarColor,
    required this.gray950,
    required this.gray700,
    required this.borderColor,
    required this.greyText,
    required this.textColor,
    required this.subHeadline,
    required this.triarity,
    required this.pink,
    required this.yellow,
    required this.yellowY100,
    required this.darkOrange,
    required this.darkGrey1,
    required this.darkGrey3,
    required this.darkGrey5,
    required this.lightGrey5,
    required this.midGrey5,
    required this.grey6,
    required this.ink,
    required this.pink100,
    required this.grey400,
    required this.error100,
  });

  final Color lightBlue;
  final Color primary200;
  final Color main;
  final Color cardColor;
  final Color green;
  final Color lightGreen;
  final Color greenG100;
  final Color tealT800;
  final Color red;
  final Color lightGray;
  final Color middleGray;
  final Color midGray;
  final Color midGray2;
  final Color labelTextColor;
  final Color backgroundTabBarColor;
  final Color gray950;
  final Color gray700;
  final Color borderColor;
  final Color greyText;
  final Color textColor;
  final Color subHeadline;
  final Color triarity;
  final Color pink;
  final Color yellow;
  final Color yellowY100;
  final Color darkOrange;
  final Color darkGrey1;
  final Color darkGrey3;
  final Color darkGrey5;
  final Color lightGrey5;
  final Color midGrey5;
  final Color grey6;
  final Color ink;
  final Color pink100;
  final Color grey400;
  final Color error100;

  static const ThemeColors light = ThemeColors(
    lightBlue: Color(0xFF008AFF),
    primary200: Color(0xFFD7EDFF),
    main: Color(0xFF2B2B30),
    green: Color(0xFF32B141),
    lightGreen: Color(0xFF34C759),
    greenG100: Color(0xFFEBFFF1),
    tealT800: Color(0xFF046C54),
    red: Colors.red,
    cardColor: Colors.white,
    lightGray: Color(0xFF8E8E93),
    midGray: Color(0xFF84919A),
    midGray2: Color(0xFF6E7C87),
    middleGray: Color(0xFF7E8489),
    labelTextColor: Color(0xFF6D7885),
    backgroundTabBarColor: Color(0xFFF6F6F6),
    gray950: Color(0xFF0C111D),
    gray700: Color(0xFF344054),
    borderColor: Color(0xFFE7EEF4),
    greyText: Color(0xFFA0A9B6),
    textColor: Color(0xFF111126),
    subHeadline: Color(0xFF242424),
    triarity: Color(0xFF92979B),
    pink: Color(0xFFFF2D55),
    yellow: Color(0xFFF8C51B),
    yellowY100: Color(0xFFFFFCC2),
    darkOrange: Color(0xFFFF9F0A),
    lightGrey5: Color(0xFFF6F8F9),
    midGrey5: Color(0xFFB0BABF),
    darkGrey1: Color(0xFF1A2024),
    darkGrey3: Color(0xFF303940),
    darkGrey5: Color(0xFF48535B),
    grey6: Color(0xFFF2F2F7),
    ink: Color(0xFF9103E4),
    pink100: Color(0xFFFFECEC),
    grey400: Color(0xFF98A2B3),
    error100: Color(0xFFFEE4E2),
  );

  static const ThemeColors dark = ThemeColors(
    lightBlue: Color(0xFF008AFF),
    primary200: Color(0xFFD7EDFF),
    main: Color(0xFF2B2B30),
    green: Color(0xFF32B141),
    lightGreen: Color(0xFF34C759),
    greenG100: Color(0xFFEBFFF1),
    tealT800: Color(0xFF046C54),
    red: Colors.red,
    cardColor: Color(0xFF1E1E1E),
    lightGray: Color(0xFF8E8E93),
    midGray: Color(0xFF84919A),
    midGray2: Color(0xFF6E7C87),
    middleGray: Color(0xFF7E8489),
    labelTextColor: Color(0xFF6D7885),
    backgroundTabBarColor: Color(0xFFF6F6F6),
    gray950: Color(0xFF0C111D),
    gray700: Color(0xFF344054),
    borderColor: Color(0xFFE7EEF4),
    greyText: Color(0xFFA0A9B6),
    textColor: Color(0xFF111126),
    subHeadline: Color(0xFF242424),
    triarity: Color(0xFF92979B),
    pink: Color(0xFFFF2D55),
    yellow: Color(0xFFF8C51B),
    yellowY100: Color(0xFFFFFCC2),
    darkOrange: Color(0xFFFF9F0A),
    lightGrey5: Color(0xFFF6F8F9),
    midGrey5: Color(0xFFB0BABF),
    darkGrey1: Color(0xFF1A2024),
    darkGrey3: Color(0xFF303940),
    darkGrey5: Color(0xFF48535B),
    grey6: Color(0xFFF2F2F7),
    ink: Color(0xFF9103E4),
    pink100: Color(0xFFFFECEC),
    grey400: Color(0xFF98A2B3),
    error100: Color(0xFFFEE4E2),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? lightBlue,
    Color? primary200,
    Color? cardColor,
    Color? main,
    Color? green,
    Color? lightGreen,
    Color? greenG100,
    Color? tealT800,
    Color? red,
    Color? lightGray,
    Color? midGray,
    Color? midGray2,
    Color? middleGray,
    Color? labelTextColor,
    Color? backgroundTabBarColor,
    Color? gray950,
    Color? gray700,
    Color? borderColor,
    Color? greyText,
    Color? textColor,
    Color? subHeadline,
    Color? triarity,
    Color? pink,
    Color? yellow,
    Color? yellowY100,
    Color? darkOrange,
    Color? darkGrey1,
    Color? darkGrey3,
    Color? darkGrey5,
    Color? lightGrey5,
    Color? midGrey5,
    Color? grey6,
    Color? ink,
    Color? pink100,
    Color? grey400,
    Color? error100,
  }) =>
      ThemeColors(
        lightBlue: lightBlue ?? this.lightBlue,
        primary200: primary200 ?? this.primary200,
        green: green ?? this.green,
        lightGreen: lightGreen ?? this.lightGreen,
        greenG100: greenG100 ?? this.greenG100,
        tealT800: tealT800 ?? this.tealT800,
        red: red ?? this.red,
        cardColor: cardColor ?? this.cardColor,
        main: main ?? this.main,
        lightGray: lightGray ?? this.lightGray,
        middleGray: middleGray ?? this.middleGray,
        midGray: midGray ?? this.midGray,
        midGray2: midGray2 ?? this.midGray2,
        labelTextColor: labelTextColor ?? this.labelTextColor,
        backgroundTabBarColor:
            backgroundTabBarColor ?? this.backgroundTabBarColor,
        gray950: gray950 ?? this.gray950,
        gray700: gray700 ?? this.gray700,
        borderColor: borderColor ?? this.borderColor,
        greyText: greyText ?? this.greyText,
        textColor: textColor ?? this.textColor,
        subHeadline: subHeadline ?? this.subHeadline,
        triarity: triarity ?? this.triarity,
        pink: pink ?? this.pink,
        yellow: yellow ?? this.yellow,
        yellowY100: yellowY100 ?? this.yellowY100,
        darkOrange: darkOrange ?? this.darkOrange,
        darkGrey1: darkGrey1 ?? this.darkGrey1,
        darkGrey3: darkGrey3 ?? this.darkGrey3,
        darkGrey5: darkGrey5 ?? this.darkGrey5,
        lightGrey5: lightGrey5 ?? this.lightGrey5,
        midGrey5: midGrey5 ?? this.midGrey5,
        grey6: grey6 ?? this.grey6,
        ink: ink ?? this.ink,
        pink100: pink100 ?? this.pink100,
        grey400: grey400 ?? this.grey400,
        error100: error100 ?? this.error100,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      primary200: Color.lerp(primary200, other.primary200, t)!,
      green: Color.lerp(green, other.green, t)!,
      lightGreen: Color.lerp(lightGreen, other.lightGreen, t)!,
      greenG100: Color.lerp(greenG100, other.greenG100, t)!,
      tealT800: Color.lerp(tealT800, other.tealT800, t)!,
      red: Color.lerp(red, other.red, t)!,
      main: Color.lerp(main, other.main, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      lightGray: Color.lerp(lightGray, other.lightGray, t)!,
      middleGray: Color.lerp(middleGray, other.middleGray, t)!,
      midGray: Color.lerp(midGray, other.midGray, t)!,
      midGray2: Color.lerp(midGray2, other.midGray2, t)!,
      labelTextColor: Color.lerp(labelTextColor, other.labelTextColor, t)!,
      backgroundTabBarColor:
          Color.lerp(backgroundTabBarColor, other.backgroundTabBarColor, t)!,
      gray950: Color.lerp(gray950, other.gray950, t)!,
      gray700: Color.lerp(gray700, other.gray700, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      greyText: Color.lerp(greyText, other.greyText, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      subHeadline: Color.lerp(subHeadline, other.subHeadline, t)!,
      triarity: Color.lerp(triarity, other.triarity, t)!,
      pink: Color.lerp(pink, other.pink, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      yellowY100: Color.lerp(yellowY100, other.yellowY100, t)!,
      darkOrange: Color.lerp(darkOrange, other.darkOrange, t)!,
      darkGrey1: Color.lerp(darkGrey1, other.darkGrey1, t)!,
      darkGrey3: Color.lerp(darkGrey3, other.darkGrey3, t)!,
      darkGrey5: Color.lerp(darkGrey5, other.darkGrey5, t)!,
      lightGrey5: Color.lerp(lightGrey5, other.lightGrey5, t)!,
      midGrey5: Color.lerp(midGrey5, other.midGrey5, t)!,
      grey6: Color.lerp(grey6, other.grey6, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      pink100: Color.lerp(pink100, other.pink100, t)!,
      grey400: Color.lerp(grey400, other.grey400, t)!,
      error100: Color.lerp(error100, other.error100, t)!,
    );
  }
}
