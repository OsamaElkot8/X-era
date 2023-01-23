import 'package:flutter/material.dart';

class NightStarsPaint extends CustomPainter {
  final Color upperColor, lowerColor;
  const NightStarsPaint({required this.upperColor, required this.lowerColor});

  final double _circlesRadius = 1.0,
      _starLongLineStrokeWidth = 2.0,
      _starShortLineStrokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    // painting upper layout
    final double upperHeight = height / 3.0;
    final double curveHeight = (upperHeight / 6);
    final double curveWidth = (width / 8);
    final upper = Paint()
      ..color = upperColor
      ..style = PaintingStyle.fill;

    Path upperPath = Path()
      ..moveTo(0, 0)
      ..lineTo(width, 0)
      ..lineTo(width, upperHeight)
      ..quadraticBezierTo(width, upperHeight - curveHeight, width - curveWidth,
          upperHeight - curveHeight)
      ..lineTo(curveWidth, upperHeight - curveHeight)
      ..quadraticBezierTo(0, upperHeight - curveHeight, 0, upperHeight)
      ..lineTo(0, 0);

    canvas.drawPath(upperPath, upper);

    // painting lower layout
    final lower = Paint()
      ..color = lowerColor
      ..style = PaintingStyle.fill;

    Path lowerPath = Path()
      ..moveTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, upperHeight)
      ..quadraticBezierTo(width, upperHeight - curveHeight, width - curveWidth,
          upperHeight - curveHeight)
      ..lineTo(curveWidth, upperHeight - curveHeight)
      ..quadraticBezierTo(0, upperHeight - curveHeight, 0, upperHeight)
      ..lineTo(0, height);

    canvas.drawPath(lowerPath, lower);

    // draw circles
    var circlePaint = Paint()
      ..color = lowerColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(width / 15, upperHeight / 2.8), _circlesRadius, circlePaint);
    canvas.drawCircle(
        Offset(width / 3.8, upperHeight / 2.3), _circlesRadius, circlePaint);
    canvas.drawCircle(
        Offset(width / 2.2, upperHeight / 5), _circlesRadius, circlePaint);
    canvas.drawCircle(
        Offset(width / 1.5, upperHeight / 2.6), _circlesRadius, circlePaint);
    canvas.drawCircle(
        Offset(width / 1.1, upperHeight / 2.45), 2.0, circlePaint);

    // draw star circle
    final starCircle = Paint()
      ..color = lowerColor.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final double starCircleStartOffsetX = width / 8;
    final double starCircleEndOffsetX = width / 6.7;
    final double starCircleMiddleOffsetX = starCircleStartOffsetX +
        ((starCircleEndOffsetX - starCircleStartOffsetX) / 2);
    final double starCircleStartOffsetY = upperHeight / 2.55;
    final double starCircleEndOffsetY = upperHeight / 2.3;
    final double starCircleMiddleOffsetY = starCircleStartOffsetY +
        ((starCircleEndOffsetY - starCircleStartOffsetY) / 2);

    Path starCirclePath = Path()
      ..moveTo(starCircleMiddleOffsetX, starCircleStartOffsetY)
      ..quadraticBezierTo(starCircleEndOffsetX, starCircleStartOffsetY,
          starCircleEndOffsetX, starCircleMiddleOffsetY)
      ..quadraticBezierTo(starCircleEndOffsetX, starCircleEndOffsetY,
          starCircleMiddleOffsetX, starCircleEndOffsetY)
      ..quadraticBezierTo(starCircleStartOffsetX, starCircleEndOffsetY,
          starCircleStartOffsetX, starCircleMiddleOffsetY)
      ..quadraticBezierTo(starCircleStartOffsetX, starCircleStartOffsetY,
          starCircleMiddleOffsetX, starCircleStartOffsetY);

    canvas.drawPath(starCirclePath, starCircle);

    // painting star long line layout
    final starLongLine = Paint()
      ..color = lowerColor.withOpacity(0.2)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _starLongLineStrokeWidth
      ..style = PaintingStyle.stroke;

    final double starLineStartOffsetX = starCircleStartOffsetX -
        ((starCircleEndOffsetX - starCircleStartOffsetX) / 25);
    final double starLineEndOffsetX = starCircleEndOffsetX +
        ((starCircleEndOffsetX - starCircleStartOffsetX) / 25);
    final double starLineStartOffsetY = starCircleStartOffsetY -
        ((starCircleEndOffsetY - starCircleStartOffsetY) / 25);
    final double starLineEndOffsetY = starCircleEndOffsetY +
        ((starCircleEndOffsetY - starCircleStartOffsetY) / 25);
    final double starLineMiddleOffsetX = starLineStartOffsetX +
        ((starLineEndOffsetX - starLineStartOffsetX) / 2);
    final double starLineMiddleOffsetY = starLineStartOffsetY +
        ((starLineEndOffsetY - starLineStartOffsetY) / 2);

    Path starLinePath = Path()
      ..moveTo(starLineStartOffsetX, starLineMiddleOffsetY)
      ..lineTo(starLineEndOffsetX, starLineMiddleOffsetY)
      ..moveTo(starLineMiddleOffsetX, starLineStartOffsetY)
      ..lineTo(starLineMiddleOffsetX, starLineEndOffsetY);

    canvas.drawPath(starLinePath, starLongLine);

    // painting short line layout
    final starShortLine = Paint()
      ..color = lowerColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _starShortLineStrokeWidth
      ..style = PaintingStyle.stroke;

    final double starShortLineStartOffsetX = starCircleStartOffsetX +
        ((starCircleEndOffsetX - starCircleStartOffsetX) / 4.5);
    final double starShortLineEndOffsetX = starCircleEndOffsetX -
        ((starCircleEndOffsetX - starCircleStartOffsetX) / 4.5);
    final double starShortLineStartOffsetY = starCircleStartOffsetY +
        ((starCircleEndOffsetY - starCircleStartOffsetY) / 4.5);
    final double starShortLineEndOffsetY = starCircleEndOffsetY -
        ((starCircleEndOffsetY - starCircleStartOffsetY) / 4.5);
    final double starShortLineMiddleOffsetX = starShortLineStartOffsetX +
        ((starShortLineEndOffsetX - starShortLineStartOffsetX) / 2);
    final double starShortLineMiddleOffsetY = starShortLineStartOffsetY +
        ((starShortLineEndOffsetY - starShortLineStartOffsetY) / 2);

    Path starShortLinePath = Path()
      ..moveTo(starShortLineStartOffsetX, starShortLineMiddleOffsetY)
      ..lineTo(starShortLineEndOffsetX, starShortLineMiddleOffsetY)
      ..moveTo(starShortLineMiddleOffsetX, starShortLineStartOffsetY)
      ..lineTo(starShortLineMiddleOffsetX, starShortLineEndOffsetY);

    canvas.drawPath(starShortLinePath, starShortLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
