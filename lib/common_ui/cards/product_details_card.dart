import '../../data/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.white.withValues(alpha: 0.7),
        child: Image.asset(product.imageUrl),
      ),
    );
  }
}
