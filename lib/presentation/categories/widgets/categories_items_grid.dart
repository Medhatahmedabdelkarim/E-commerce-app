import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_product_card.dart';
import '../manager/category_product_bloc/categories_bloc.dart';

class CategoriesItemsGrid extends StatefulWidget {
  final int categoryId;

  const CategoriesItemsGrid({super.key, required this.categoryId});

  @override
  State<CategoriesItemsGrid> createState() => _CategoriesItemsGridState();
}

class _CategoriesItemsGridState extends State<CategoriesItemsGrid> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<CategoriesBloc>().add(
      FetchCategoryProducts(widget.categoryId, isInitialLoad: true),
    );

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<CategoriesBloc>().add(
          FetchCategoryProducts(widget.categoryId),
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading && state is! CategoriesLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesLoaded) {
          final products = state.products;

          if (products.isEmpty) {
            return const Center(child: Text("No products found"));
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedEnd
                    ? products.length
                    : products.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 253,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  if (index < products.length) {
                    return CategoryProductCard(product: products[index]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
