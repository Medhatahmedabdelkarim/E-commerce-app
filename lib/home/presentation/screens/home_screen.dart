import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/common_ui/Widgets/cart_icon_design.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_ui/Widgets/categories_list.dart';
import '../../../common_ui/Widgets/products_grid.dart';
import '../../../common_ui/cards/home_main_card.dart';
import '../../../data/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('E-commerce')),
          automaticallyImplyLeading: false,
          actions: [
            CartIconDesign(),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Text('Featured', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                CardDesign(),

                SizedBox(height: 12),

                Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                CategoriesListView(
                  categories: [
                    Category(
                      imageUrl: "assets/Images/cleaning.png",
                      title: "Cleaning",
                    ),
                    Category(
                      imageUrl: "assets/Images/appliances.png",
                      title: "Appliances",
                    ),
                    Category(
                      imageUrl: "assets/Images/shopping.png",
                      title: "Shopping",
                    ),
                    Category(
                      imageUrl: "assets/Images/clothes.png",
                      title: "Clothes",
                    ),
                    Category(
                      imageUrl: "assets/Images/sports.png",
                      title: "Sports",
                    ),
                    Category(
                      imageUrl: "assets/Images/self-care.png",
                      title: "Self-Care",
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'All Products',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                ProductsGridView(
                  products: [
                    Product(
                      title: "Sleek Boxing Gloves",
                      price: "27.00",
                      imageUrl: "assets/Images/mimic.png",
                      description:
                      "Modern boxing gloves include mesh palm, velcro, leather-based stitching, suspension cushioning and new padding for the boxer. The International Boxing Association approves new designs of gloves according to rules around weight and the amount of leather, padding and support allowed.",
                    ),
                    Product(
                      title: "Boxing Bag",
                      price: "1000.0",
                      imageUrl: "assets/Images/boxingbag.jpg",
                      description:
                      "A punching bag (or British English punchbag) is a sturdy bag designed to be repeatedly punched. A punching bag is usually cylindrical and filled with various materials of suitable hardness.",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


