import 'dart:ui';

import 'package:flutter/material.dart';

typedef PathBuilder = Path Function(Size);

enum BorderType { circle, rRect, rect, oval }

class DashPainter extends CustomPainter {
   DashPainter({
    this.strokeWidth = 1,
    this.dashPattern = const [4, 4],
    this.color = Colors.black,
    this.borderType = BorderType.rRect,
    this.radius = const Radius.circular(8),
    this.strokeCap = StrokeCap.butt,
    this.customPath,
    this.padding = EdgeInsets.zero,
  }) : assert(dashPattern.isNotEmpty, 'Dash Pattern cannot be empty');

  final double strokeWidth;
  final List<double> dashPattern;
  final Color color;
  final BorderType borderType;
  final Radius radius;
  final StrokeCap strokeCap;
  final PathBuilder? customPath;
  final EdgeInsets padding;

  @override
  void paint(Canvas canvas, Size size) {
    final Size size1;
    if (padding == EdgeInsets.zero) {
      size1 = size;
    } else {
      canvas.translate(padding.left, padding.top);
      size1 = Size(
        size.width - padding.horizontal,
        size.height - padding.vertical,
      );
    }

    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;

    Path path;
    if (customPath != null) {
      path = dashPath(
        customPath!(size1),
        dashArray: CircularIntervalList(dashPattern),
      );
    } else {
      path = _getPath(size1);
    }

    canvas.drawPath(path, paint);
  }

  Path _getPath(Size size) {
    Path path;
    switch (borderType) {
      case BorderType.circle:
        path = _getCirclePath(size);
      case BorderType.rRect:
        path = _getRRectPath(size, radius);
      case BorderType.rect:
        path = _getRectPath(size);
      case BorderType.oval:
        path = _getOvalPath(size);
    }

    return dashPath(path, dashArray: CircularIntervalList(dashPattern));
  }

  Path _getCirclePath(Size size) {
    final double w = size.width;
    final double h = size.height;
    final double s = size.shortestSide;

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            w > s ? (w - s) / 2 : 0,
            h > s ? (h - s) / 2 : 0,
            s,
            s,
          ),
          Radius.circular(s / 2),
        ),
      );
  }

  Path _getRRectPath(Size size, Radius radius) => Path()
    ..addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
        radius,
      ),
    );

  Path _getRectPath(Size size) => Path()
    ..addRect(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

  Path _getOvalPath(Size size) => Path()
    ..addOval(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

  @override
  bool shouldRepaint(DashPainter oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.color != color ||
      oldDelegate.dashPattern != dashPattern ||
      oldDelegate.padding != padding ||
      oldDelegate.borderType != borderType;
}

Path dashPath(
  Path source, {
  required CircularIntervalList<double> dashArray,
  DashOffset? dashOffset,
}) {
  dashOffset = dashOffset ?? const DashOffset.absolute(0);

  final Path dest = Path();
  for (final PathMetric metric in source.computeMetrics()) {
    double distance = dashOffset._calculate(metric.length);
    bool draw = true;
    while (distance < metric.length) {
      final double len = dashArray.next;
      if (draw) {
        dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
      }
      distance += len;
      draw = !draw;
    }
  }

  return dest;
}

enum _DashOffsetType { absolute, percentage }

class DashOffset {
  DashOffset.percentage(double percentage)
      : _rawVal = percentage.clamp(0, 1),
        _dashOffsetType = _DashOffsetType.percentage;

  const DashOffset.absolute(double start)
      : _rawVal = start,
        _dashOffsetType = _DashOffsetType.absolute;

  final double _rawVal;
  final _DashOffsetType _dashOffsetType;

  double _calculate(double length) =>
      _dashOffsetType == _DashOffsetType.absolute ? _rawVal : length * _rawVal;

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) {
  //     return true;
  //   }
  //
  //   return other is DashOffset &&
  //       other._rawVal == _rawVal &&
  //       other._dashOffsetType == _dashOffsetType;
  // }

  // @override
  // final int hashCode = Object.hash(_rawVal, _dashOffsetType);
}

class CircularIntervalList<T> {
  CircularIntervalList(List<T> vals) : _vals = vals;

  final List<T> _vals;
  int _idx = 0;

  T get next {
    if (_idx >= _vals.length) {
      _idx = 0;
    }
    return _vals[_idx++];
  }
}
