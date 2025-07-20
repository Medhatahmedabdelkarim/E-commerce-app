import 'package:demo_app/categories/presentation/widgets/CategoryProductCard.dart';
import 'package:demo_app/categories/presentation/widgets/category_grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesItemsGrid extends StatelessWidget{
  CategoriesItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          crossAxisCount: 2,
          mainAxisExtent: 241,
        ),
        children: [
          CategoryProductCard()
        ],),
    );

  }

}