import 'package:flutter/material.dart';

class AppBarPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var rect =Offset.zero&size;
    Paint paint=Paint();
    Path path=Path();
    paint.shader= LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors:[

          Colors.white,
          Colors.red.shade700,


        ]
    ).createShader(rect);
    path.lineTo(0,size.height - size.height/8);
    path.conicTo(size.width/5, size.height, size.width, size.height-size.height/5,9);
    path.lineTo(size.width, 0);
    canvas.drawShadow(path, Colors.blueGrey.shade800, 10, false);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}