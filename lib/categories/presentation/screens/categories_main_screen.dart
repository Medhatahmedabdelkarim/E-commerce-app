import 'package:demo_app/categories/presentation/widgets/category_grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesMainScreen extends StatelessWidget{
  CategoriesMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text('Categories',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  crossAxisCount: 2,
                ),
                children: [
                  CategoryGridItem(categoryImage: "assets/Images/Office.jpg",title: "Office",),
                  CategoryGridItem(categoryImage: "assets/Images/livingroom.jpg",title: "Living Room"),
                  CategoryGridItem(categoryImage: "assets/Images/Kitchen.jpg",title: "Kitchen"),
                  CategoryGridItem(categoryImage: "assets/Images/bedroom.jpg",title: "Bedroom"),
                ],),
            ),
          ),
        ],
      ),
    );
  }

}