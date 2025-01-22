import 'package:flutter/material.dart';

class DashedVerticalDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashGap;
  final double indent;
  final double endIndent;

  const DashedVerticalDivider({
    super.key,
    required this.color,
    this.thickness = 1.0,
    this.dashLength = 4.0,
    this.dashGap = 2.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: CustomPaint(
        painter: DashedLinePainter(
          color: color,
          thickness: thickness,
          dashLength: dashLength,
          dashGap: dashGap,
        ),
        child: Container(
          margin: EdgeInsets.only(top: indent, bottom: endIndent),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashGap;

  DashedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashLength),
        paint,
      );
      startY += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
