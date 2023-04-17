import 'package:flutter/material.dart';

CustomPaint fullShieldImage({required double screenWidth}) {
  return CustomPaint(
    size: Size(screenWidth, (screenWidth * 2).toDouble()),
    painter: FullShieldImage(),
  );
}

class FullShieldImage extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.07019275);
    path_0.cubicTo(
      size.width * 0.2557159,
      size.height * 0.2091742,
      size.width * -0.02489667,
      size.height * 0.2707366,
      size.width * -0.3371194,
      size.height * 0.2649311,
    );
    path_0.cubicTo(
      size.width * -0.2354309,
      size.height * 0.7114618,
      size.width * 0.1284542,
      size.height * 0.8254923,
      size.width * 0.5000000,
      size.height * 0.9298073,
    );
    path_0.cubicTo(
      size.width * 0.8715457,
      size.height * 0.8254923,
      size.width * 1.235431,
      size.height * 0.7114618,
      size.width * 1.337119,
      size.height * 0.2649311,
    );
    path_0.cubicTo(
      size.width * 1.024897,
      size.height * 0.2707366,
      size.width * 0.7442841,
      size.height * 0.2091742,
      size.width * 0.5000000,
      size.height * 0.07019275,
    );
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    paint_0_stroke.color = const Color(0xffffffff).withOpacity(0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.07019275);
    path_1.cubicTo(
      size.width * 0.2557159,
      size.height * 0.2091742,
      size.width * -0.02489667,
      size.height * 0.2707366,
      size.width * -0.3371194,
      size.height * 0.2649311,
    );
    path_1.cubicTo(
      size.width * -0.2354309,
      size.height * 0.7114618,
      size.width * 0.1284542,
      size.height * 0.8254923,
      size.width * 0.5000000,
      size.height * 0.9298073,
    );
    path_1.cubicTo(
      size.width * 0.8715457,
      size.height * 0.8254923,
      size.width * 1.235431,
      size.height * 0.7114618,
      size.width * 1.337119,
      size.height * 0.2649311,
    );
    path_1.cubicTo(
      size.width * 1.024897,
      size.height * 0.2707366,
      size.width * 0.7442841,
      size.height * 0.2091742,
      size.width * 0.5000000,
      size.height * 0.07019275,
    );
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    paint_1_stroke.color = const Color(0xffffffff).withOpacity(0);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
