import 'dart:math' as math;
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  ProgressPainter({
    @required this.animation,
    @required this.backgroundColor,
    @required this.color,
  }) : super(repaint: animation);

  /// Animation representing what we are painting
  final Animation<double> animation;

  /// The color in the background of the circle
  final Color backgroundColor;

  /// The foreground color used to indicate progress
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = backgroundColor
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
    paint.color = color;
    canvas.drawCircle(Offset(size.height * 3 + size.width * animation.value, 0),
        size.height * 3, paint);
    paint = new Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
        Offset.zero, Offset(size.width * animation.value, 0), paint);
  }

  @override
  bool shouldRepaint(ProgressPainter other) {
    return animation.value != other.animation.value ||
        color != other.color ||
        backgroundColor != other.backgroundColor;
  }
}
