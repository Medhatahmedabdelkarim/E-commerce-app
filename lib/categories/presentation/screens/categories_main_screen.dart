import 'package:demo_app/common_ui/Widgets/home_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category.dart';
import '../../../services/api_services.dart';
import '../widgets/categories_grid_view.dart';

class CategoriesMainScreen extends StatelessWidget {
  CategoriesMainScreen({super.key});

  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: FutureBuilder(
                future: apiService.getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData) {
                    return Center(child: Text("Product not found"));
                  } else {
                    final List<Category> categories = snapshot.data!;
                    return CategoriesGridView(categories: categories);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
