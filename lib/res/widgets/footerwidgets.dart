import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CustomPaint(
            size: Size(500, 600),
            painter: CurvedPainter2(),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(500, 400),
            painter: CurvedPainter1(),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(500, 400),
            painter: CurvedPainter3(),
          ),
        ),
      ],
    );
  }
}

class CurvedPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 191, 226, 254).withOpacity(.5)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.13, size.height * 0.55,
        size.width * 0.4, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.95,
        size.width * .80, size.height * 0.45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 191, 226, 254).withOpacity(.2)
      ..strokeWidth = 10;

    var path = Path();

    path.moveTo(0, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.17, size.height * 0.5,
        size.width * 0.5, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.67, size.height * 0.95,
        size.width * .80, size.height * 0.45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 191, 226, 254).withOpacity(.7)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.97);
    path.quadraticBezierTo(size.width * 0.67, size.height * 0.50,
        size.width * 0.80, size.height * 0.90);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.97,
        size.width * .70, size.height * 0.9);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
