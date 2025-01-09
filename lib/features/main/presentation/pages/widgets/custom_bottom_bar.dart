import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor,
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 0,
          notchMargin: 1.2,
          padding: EdgeInsets.zero,
          shape: CircularNotchedAndCorneredRectangle(
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 0,
            rightCornerRadius: 0,
          ),
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            children: [
              BottomMenuItem(
                onTap: () {
                  onTap?.call(0);
                },
                isSelected: currentIndex == 0,
                label: 'Главная',
                icon: AppIcons.home,
              ),
              BottomMenuItem(
                onTap: () {
                  onTap?.call(1);
                },
                isSelected: currentIndex == 1,
                label: 'Оплата',
                icon: AppIcons.star,
              ),
              const Expanded(child: AppUtils.kGap),
              BottomMenuItem(
                onTap: () {
                  onTap?.call(2);
                },
                isSelected: currentIndex == 2,
                label: 'Мониторинг',
                icon: AppIcons.search,
              ),
              BottomMenuItem(
                onTap: () {
                  onTap?.call(3);
                },
                isSelected: currentIndex == 3,
                label: 'Сервисы',
                icon: AppIcons.scissors,
              ),
            ],
          ),
        ),
      );
}

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? context.colorScheme.primary
        : context.theme.bottomNavigationBarTheme.unselectedItemColor;
    final style = isSelected
        ? context.theme.bottomNavigationBarTheme.selectedLabelStyle
        : context.theme.bottomNavigationBarTheme.unselectedLabelStyle;
    return Expanded(
      child: InkResponse(
        onTap: onTap,
        customBorder: const CircleBorder(),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            AppUtils.kGap4,
            Text(label, style: style),
          ],
        ),
      ),
    );
  }
}

extension on NotchSmoothness? {
  static const curveS1 = {
    NotchSmoothness.sharpEdge: 0.0,
    NotchSmoothness.defaultEdge: 15.0,
    NotchSmoothness.softEdge: 20.0,
    NotchSmoothness.smoothEdge: 30.0,
    NotchSmoothness.verySmoothEdge: 40.0,
  };

  static const curveS2 = {
    NotchSmoothness.sharpEdge: 0.1,
    NotchSmoothness.defaultEdge: 1.0,
    NotchSmoothness.softEdge: 10.0,
    NotchSmoothness.smoothEdge: 15.0,
    NotchSmoothness.verySmoothEdge: 25.0,
  };

  double get s1 => curveS1[this] ?? 15.0;

  double get s2 => curveS2[this] ?? 1.0;
}

enum NotchSmoothness {
  sharpEdge,
  defaultEdge,
  softEdge,
  smoothEdge,
  verySmoothEdge
}

class GapLocationException implements Exception {
  GapLocationException(this._cause) : super();
  final String _cause;

  @override
  String toString() => _cause;
}

enum GapLocation { none, center, end }

class CircularNotchedAndCorneredRectangle extends NotchedShape {
  CircularNotchedAndCorneredRectangle({
    required this.notchSmoothness,
    required this.gapLocation,
    required this.leftCornerRadius,
    required this.rightCornerRadius,
    this.animation,
  });

  /// Creates a [CircularNotchedAndCorneredRectangle].
  ///
  /// The same object can be used to create multiple shapes.
  final Animation<double>? animation;
  final NotchSmoothness notchSmoothness;
  final GapLocation gapLocation;
  final double leftCornerRadius;
  final double rightCornerRadius;

  /// Creates a [Path] that describes a rectangle with a smooth circular notch.
  ///
  /// `host` is the bounding box for the returned shape. Conceptually this is
  /// the rectangle to which the notch will be applied.
  ///
  /// `guest` is the bounding box of a circle that the notch accommodates. All
  /// points in the circle bounded by `guest` will be outside of the returned
  /// path.
  ///
  /// The notch is curve that smoothly connects the host's top edge and
  /// the guest circle.
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      if (this.rightCornerRadius > 0 || this.leftCornerRadius > 0) {
        final double leftCornerRadius =
            this.leftCornerRadius * (animation?.value ?? 1);
        final double rightCornerRadius =
            this.rightCornerRadius * (animation?.value ?? 1);
        return Path()
          ..moveTo(host.left, host.bottom)
          ..lineTo(host.left, host.top + leftCornerRadius)
          ..arcToPoint(
            Offset(host.left + leftCornerRadius, host.top),
            radius: Radius.circular(leftCornerRadius),
          )
          ..lineTo(host.right - rightCornerRadius, host.top)
          ..arcToPoint(
            Offset(host.right, host.top + rightCornerRadius),
            radius: Radius.circular(rightCornerRadius),
          )
          ..lineTo(host.right, host.bottom)
          ..lineTo(host.left, host.bottom)
          ..close();
      }
      return Path()..addRect(host);
    }

    final guestCenterDx = guest.center.dx.toInt();
    final halfOfHostWidth = host.width ~/ 2;

    if (guestCenterDx == halfOfHostWidth) {
      if (gapLocation == GapLocation.end) {
        throw GapLocationException(
          'Wrong gap location in  towards FloatingActionButtonLocation => '
          'consider use ${GapLocation.center} instead of $gapLocation or change FloatingActionButtonLocation',
        );
      }
    }

    if (guestCenterDx != halfOfHostWidth) {
      if (gapLocation == GapLocation.center) {
        throw GapLocationException(
          'Wrong gap location in  towards FloatingActionButtonLocation => '
          'consider use ${GapLocation.end} instead of $gapLocation or change FloatingActionButtonLocation',
        );
      }
    }

    // The guest's shape is a circle bounded by the guest rectangle.
    // So the guest's radius is half the guest width.
    final double notchRadius = guest.width / 2 * (animation?.value ?? 1);
    final double leftCornerRadius =
        this.leftCornerRadius * (animation?.value ?? 1);
    final double rightCornerRadius =
        this.rightCornerRadius * (animation?.value ?? 1);

    // We build a path for the notch from 3 segments:
    // Segment A - a Bezier curve from the host's top edge to segment B.
    // Segment B - an arc with radius notchRadius.
    // Segment C - a Bezier curve from segment B back to the host's top edge.
    //
    // A detailed explanation and the derivation of the formulas below is
    // available at: https://goo.gl/Ufzrqn

    final double s1 = notchSmoothness.s1;
    final double s2 = notchSmoothness.s2;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset> p = List.filled(6, Offset.zero, growable: true);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) {
      p[i] += guest.center;
    }

    return Path()
      ..moveTo(host.left, host.bottom)
      ..lineTo(host.left, host.top + leftCornerRadius)
      ..arcToPoint(
        Offset(host.left + leftCornerRadius, host.top),
        radius: Radius.circular(leftCornerRadius),
      )
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right - rightCornerRadius, host.top)
      ..arcToPoint(
        Offset(host.right, host.top + rightCornerRadius),
        radius: Radius.circular(rightCornerRadius),
      )
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
