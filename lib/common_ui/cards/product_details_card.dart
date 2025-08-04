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
var items = [];

class _ProductDetailsCardState extends State<ProductDetailsCard> {
  @override
  Widget build(BuildContext context) {
    items.clear();
    for (var i in widget.product.images) {
      items.add(Image.network(i, fit: BoxFit.cover));
    }
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
            itemCount: items.length,
            itemBuilder: (context, pagePosition) {
              return items[currentIndex];
            },
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: DotsIndicator(
              dotsCount: items.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                color: Color.fromRGBO(31, 32, 36, 1),
                activeColor: Color.fromRGBO(0, 25, 255, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
