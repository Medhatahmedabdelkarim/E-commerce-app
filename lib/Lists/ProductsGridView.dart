import 'package:demo_app/cards/ProductCard.dart';
import 'package:demo_app/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:600 ,
      child:GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for(final product in products)
            ProductCard(product: product)
        ],

      ),
    );
  }
}

