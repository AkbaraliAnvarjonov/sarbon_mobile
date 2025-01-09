import 'package:flutter/material.dart';

class LogoPainter extends CustomPainter {
  const LogoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.8438781, size.height * 0.2746663)
      ..cubicTo(
        size.width * 0.8258594,
        size.height * 0.2447209,
        size.width * 0.8039344,
        size.height * 0.2164678,
        size.width * 0.7781062,
        size.height * 0.1906406,
      )
      ..cubicTo(
        size.width * 0.6072531,
        size.height * 0.01978650,
        size.width * 0.3302438,
        size.height * 0.01978650,
        size.width * 0.1593903,
        size.height * 0.1906406,
      )
      ..cubicTo(
        size.width * -0.01146350,
        size.height * 0.3614938,
        size.width * -0.01146350,
        size.height * 0.6385031,
        size.width * 0.1593903,
        size.height * 0.8093562,
      )
      ..cubicTo(
        size.width * 0.3302438,
        size.height * 0.9802125,
        size.width * 0.6072531,
        size.height * 0.9802125,
        size.width * 0.7781062,
        size.height * 0.8093562,
      )
      ..cubicTo(
        size.width * 0.8039312,
        size.height * 0.7835344,
        size.width * 0.8258531,
        size.height * 0.7552844,
        size.width * 0.8438687,
        size.height * 0.7253437,
      )
      ..cubicTo(
        size.width * 0.8424844,
        size.height * 0.7253688,
        size.width * 0.8410969,
        size.height * 0.7253812,
        size.width * 0.8397062,
        size.height * 0.7253812,
      )
      ..lineTo(size.width * 0.6806156, size.height * 0.7253812)
      ..cubicTo(
        size.width * 0.5561438,
        size.height * 0.7253812,
        size.width * 0.4552406,
        size.height * 0.6244750,
        size.width * 0.4552406,
        size.height * 0.5000031,
      )
      ..cubicTo(
        size.width * 0.4552406,
        size.height * 0.3755312,
        size.width * 0.5561438,
        size.height * 0.2746284,
        size.width * 0.6806156,
        size.height * 0.2746284,
      )
      ..lineTo(size.width * 0.8397062, size.height * 0.2746284)
      ..cubicTo(
        size.width * 0.8411000,
        size.height * 0.2746284,
        size.width * 0.8424906,
        size.height * 0.2746413,
        size.width * 0.8438781,
        size.height * 0.2746663,
      )
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffFFC007);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path()
      ..moveTo(size.width * 0.6806156, size.height * 0.3541750)
      ..cubicTo(
        size.width * 0.6000781,
        size.height * 0.3541750,
        size.width * 0.5347875,
        size.height * 0.4194656,
        size.width * 0.5347875,
        size.height * 0.5000062,
      )
      ..cubicTo(
        size.width * 0.5347875,
        size.height * 0.5805469,
        size.width * 0.6000781,
        size.height * 0.6458375,
        size.width * 0.6806156,
        size.height * 0.6458375,
      )
      ..lineTo(size.width * 0.8397062, size.height * 0.6458375)
      ..cubicTo(
        size.width * 0.9202469,
        size.height * 0.6458375,
        size.width * 0.9855375,
        size.height * 0.5805469,
        size.width * 0.9855375,
        size.height * 0.5000062,
      )
      ..cubicTo(
        size.width * 0.9855375,
        size.height * 0.4194656,
        size.width * 0.9202469,
        size.height * 0.3541750,
        size.width * 0.8397062,
        size.height * 0.3541750,
      )
      ..lineTo(size.width * 0.6806156, size.height * 0.3541750)
      ..close()
      ..moveTo(size.width * 0.8400375, size.height * 0.4219281)
      ..cubicTo(
        size.width * 0.7969531,
        size.height * 0.4219281,
        size.width * 0.7620250,
        size.height * 0.4569219,
        size.width * 0.7620250,
        size.height * 0.5000062,
      )
      ..cubicTo(
        size.width * 0.7620250,
        size.height * 0.5430906,
        size.width * 0.7969531,
        size.height * 0.5780844,
        size.width * 0.8400375,
        size.height * 0.5780844,
      )
      ..cubicTo(
        size.width * 0.8831187,
        size.height * 0.5780844,
        size.width * 0.9180469,
        size.height * 0.5430906,
        size.width * 0.9180469,
        size.height * 0.5000062,
      )
      ..cubicTo(
        size.width * 0.9180469,
        size.height * 0.4569219,
        size.width * 0.8831187,
        size.height * 0.4219281,
        size.width * 0.8400375,
        size.height * 0.4219281,
      )
      ..close();

    final Paint paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff32B141);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
