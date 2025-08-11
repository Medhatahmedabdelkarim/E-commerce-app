import 'package:demo_app/domain/entities/category_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/category.dart';
import 'category_grid_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
    required this.categories,
  });

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 2,
      ), itemBuilder: (BuildContext context, int index) {
      final cat = categories[index];
      print('Category at $index: id=${cat.id}');  // Add this debug print!
      return CategoryGridItem(category: cat);
    },
    );
  }
}