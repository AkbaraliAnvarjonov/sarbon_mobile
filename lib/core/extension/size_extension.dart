part of 'extension.dart';

extension SizeExtension on BuildContext {
  bool get isMobile =>
      kSize.width < 600 && (Platform.isAndroid || Platform.isIOS);

  bool get isTablet =>
      kSize.width > 600 && (Platform.isAndroid || Platform.isIOS);

  EdgeInsets get kMargin16 => EdgeInsets.only(
        top: padding.top,
        left: isMobile ? 16 : 200,
        right: isMobile ? 16 : 200,
        bottom: padding.bottom,
      );

  EdgeInsets get kMarginBottom16 => EdgeInsets.only(
        bottom: padding.bottom,
        left: isMobile ? 16 : 200,
        right: isMobile ? 16 : 200,
      );

  Size get kSize => MediaQuery.sizeOf(this);

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);
}

extension OrientationExtension on Orientation {
  bool get isPortrait => this == Orientation.portrait;
}
