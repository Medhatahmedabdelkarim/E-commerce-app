import 'package:flutter/material.dart';

import '../../data/models/category.dart';

class CategoriesDesign extends StatelessWidget {
  const CategoriesDesign({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Image(
                  image: Image.network(category.image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(category.name, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
