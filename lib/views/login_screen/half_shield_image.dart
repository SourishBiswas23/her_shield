import 'package:flutter/material.dart';

CustomPaint halfShieldImage({required double screenWidth}) {
  return CustomPaint(
    size: Size(screenWidth, (screenWidth * 2).toDouble()),
    painter: HalfShieldImage(),
  );
}

class HalfShieldImage extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1254101, size.height * 0.05885084);
    path_0.cubicTo(
      size.width * -0.1188740,
      size.height * 0.1978322,
      size.width * -0.3994866,
      size.height * 0.2593947,
      size.width * -0.7117094,
      size.height * 0.2535892,
    );
    path_0.cubicTo(
      size.width * -0.6100209,
      size.height * 0.7001198,
      size.width * -0.2461357,
      size.height * 0.8141504,
      size.width * 0.1254101,
      size.height * 0.9184653,
    );
    path_0.cubicTo(
      size.width * 0.4969558,
      size.height * 0.8141504,
      size.width * 0.8608410,
      size.height * 0.7001198,
      size.width * 0.9625295,
      size.height * 0.2535892,
    );
    path_0.cubicTo(
      size.width * 0.6503068,
      size.height * 0.2593947,
      size.width * 0.3696942,
      size.height * 0.1978322,
      size.width * 0.1254101,
      size.height * 0.05885084,
    );
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    paint_0_stroke.color = const Color(0xffffffff).withOpacity(0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff00ffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1254101, size.height * 0.05885084);
    path_1.cubicTo(
      size.width * -0.1188740,
      size.height * 0.1978322,
      size.width * -0.3994866,
      size.height * 0.2593947,
      size.width * -0.7117094,
      size.height * 0.2535892,
    );
    path_1.cubicTo(
      size.width * -0.6100209,
      size.height * 0.7001198,
      size.width * -0.2461357,
      size.height * 0.8141504,
      size.width * 0.1254101,
      size.height * 0.9184653,
    );
    path_1.cubicTo(
      size.width * 0.4969558,
      size.height * 0.8141504,
      size.width * 0.8608410,
      size.height * 0.7001198,
      size.width * 0.9625295,
      size.height * 0.2535892,
    );
    path_1.cubicTo(
      size.width * 0.6503068,
      size.height * 0.2593947,
      size.width * 0.3696942,
      size.height * 0.1978322,
      size.width * 0.1254101,
      size.height * 0.05885084,
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
