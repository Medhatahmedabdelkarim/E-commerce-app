import 'package:demo_app/categories/presentation/widgets/category_product_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product.dart';
import '../../../services/api_services.dart';

class CategoriesItemsGrid extends StatelessWidget {
  CategoriesItemsGrid({super.key, required this.categoryId});

  final int categoryId;

  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: apiService.getCategoryProducts(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData) {
          return Center(child: Text("Product not found"));
        } else {
          final product = snapshot.data!;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: product.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  crossAxisCount: 2,
                  mainAxisExtent: 253,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CategoryProductCard(product: product[index]);
                },
              ),
            ),
          );
        }
      },
    );
  }
}
