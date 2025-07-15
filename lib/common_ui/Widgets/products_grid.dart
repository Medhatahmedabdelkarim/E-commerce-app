import '../cards/product_card.dart';
import '../../data/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  ProductsGridView({super.key, required this.products});
  final List<Product> products;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 209,
        child:ListView.builder(
          itemCount: products.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(product:products[index]);
        })
    );
  }
  }
