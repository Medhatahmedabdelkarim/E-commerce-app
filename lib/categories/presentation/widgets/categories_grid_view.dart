import 'package:flutter/cupertino.dart';

import '../../../data/models/category.dart';
import 'category_grid_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 2,
      ), itemBuilder: (BuildContext context, int index) {
      return CategoryGridItem(category: categories[index]);
    },
    );
  }
}