import 'package:flutter/material.dart';
class RectangleImage extends StatelessWidget {
  String image;
  double size;

  RectangleImage({this.image, this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image(
        image: AssetImage(image),
        width: size,
        height: size,
      ),
    );
  }
}
