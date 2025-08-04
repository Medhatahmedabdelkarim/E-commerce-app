import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    required this.image,
    this.applyImageRadius = true,
    this.fit = BoxFit.cover,
    this.padding = 8,
    this.backgroundColor,
  });

  final double width, height;
  final String image;
  final bool applyImageRadius;
  final Color? backgroundColor;
  final BoxFit fit;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Center(
        child: Image(fit: fit, image: AssetImage(image)),
      ),
    );
  }
}
