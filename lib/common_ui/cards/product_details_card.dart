import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../data/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsCard extends StatefulWidget {
  const ProductDetailsCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsCard> createState() => _ProductDetailsCardState();
}

int currentIndex = 0;

class _ProductDetailsCardState extends State<ProductDetailsCard> {
  @override
  Widget build(BuildContext context) {
    final items = [
      Image.network(widget.product.images[0], fit: BoxFit.cover),
      Image.network(widget.product.images[1], fit: BoxFit.cover),
    ];
    return Container(
      width: double.infinity,
      height: 346,
      child: Stack(
        children: [
          PageView.builder(
          onPageChanged: (index) {
    setState(() {
    currentIndex = index;
    });
    },
        itemCount: 2,
        itemBuilder: (context, pagePosition) {
          return items[currentIndex];
        }),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: DotsIndicator(
              dotsCount: items.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(color: Color.fromRGBO(0, 25, 255, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
