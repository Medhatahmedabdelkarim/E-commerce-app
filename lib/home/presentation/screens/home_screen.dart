import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/common_ui/Widgets/cart_icon_design.dart';
import 'package:demo_app/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_ui/Widgets/categories_list.dart';
import '../../../common_ui/Widgets/home_app_bar.dart';
import '../../../common_ui/Widgets/products_grid.dart';
import '../../../common_ui/cards/home_main_card.dart';
import '../../../constants/colors.dart';
import '../../../data/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardDesign(),

            Padding(
              padding: EdgeInsets.only(
                right: 16,
                bottom: 16,
                left: 16,
                top: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  All Products',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: EColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _body(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



FutureBuilder _body() {
  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );
  return FutureBuilder(
    future: apiService.getProduct(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Product> products = snapshot.data!;
        return _products(products);
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}

Widget _products(List<Product> products) {
  return ProductsGridView(products: products);
}
