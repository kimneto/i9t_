import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addPolygon([
      Offset(0, 0),
      Offset(80, 0),
      Offset(80, 80),
      Offset(80, 80),
      Offset(18, 80),
      Offset(0, 63),
    ], true);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
