import 'package:flutter/material.dart';

class BottomWaveImage extends StatelessWidget {
  final Image image;
  const BottomWaveImage(this.image);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: image,
      clipper: WaveClipper(),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    //wave
    var firstControl = Offset(size.width / 4, size.height);
    var firstCurveTo = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(
        firstControl.dx, firstControl.dy, firstCurveTo.dx, firstCurveTo.dy);

    var secondControl = Offset(size.width - (size.width / 3), size.height - 65);
    var secondCurveTo = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
        secondControl.dx, secondControl.dy, secondCurveTo.dx, secondCurveTo.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
