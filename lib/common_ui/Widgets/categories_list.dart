import '../../data/models/category.dart';
import 'package:flutter/material.dart';
import '../cards/categories_design.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,required this.categories
  });
  final List<Category>categories;


  @override
  Widget build(BuildContext context) {
    return Container(
        height:80,
        child:ListView(
            scrollDirection: Axis.horizontal,
             children: [for(final category in categories)
                      CategoriesDesign(category:category)
               ] )


    );
  }
}
