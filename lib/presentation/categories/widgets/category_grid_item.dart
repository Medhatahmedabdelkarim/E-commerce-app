import 'package:demo_app/domain/entities/category_entity.dart';
import 'package:demo_app/presentation/categories/screens/category_items.dart';
import 'package:flutter/material.dart';
import '../../../data/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        print(category.id);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CategoryItemsScreen(categoryId: category.id),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: Image.network(
              category.image,
              color: Colors.black.withValues(alpha: 0.2),
            ).image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
