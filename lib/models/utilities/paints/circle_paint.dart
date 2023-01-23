import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:xera_task/models/utilities/extensions/double_extension.dart';

///....
double deg2rad(double deg) => deg * math.pi / 180;

class CircularPaint extends CustomPainter {
  /// ring/border thickness, default  it will be 8px [borderThickness].
  final double borderThickness;
  final double progressValue;
  final Color color;
  final bool? withShadow;

  CircularPaint(
      {this.borderThickness = 8.0,
      required this.progressValue,
      required this.color,
      this.withShadow = false});

  final int _shadowAlpha = 125;
  final double _shadowRadius = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    final rect =
        Rect.fromCenter(center: center, width: size.width, height: size.height);

    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness;

    //transparent background
    canvas.drawArc(
      rect,
      deg2rad(0),
      deg2rad(360),
      false,
      paint,
    );

    Paint progressBarPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness
      ..color = color;

    if (withShadow!) {
      progressBarPaint
        ..color = color.withAlpha(_shadowAlpha)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal,
            DoubleExtension.convertRadiusToSigma(_shadowRadius));
    }

    canvas.drawArc(
      rect,
      deg2rad(-90),
      deg2rad(360 * progressValue),
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
