import 'package:demo_app/categories/presentation/widgets/CategoryProductCard.dart';
import 'package:demo_app/categories/presentation/widgets/category_grid_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product.dart';
import '../../../services/api_services.dart';

class SearchItemsGrid extends StatelessWidget {
  SearchItemsGrid({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            crossAxisCount: 2,
            mainAxisExtent: 253,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CategoryProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}
