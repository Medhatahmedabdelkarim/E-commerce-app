import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:demo_app/presentation/search/widgets/search_app_bar.dart';
import 'package:demo_app/presentation/search/widgets/search_items_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common_ui/manager/product_bloc.dart';
import '../../../data/models/product.dart';
import '../widgets/filter_button.dart';
import '../widgets/sort_button.dart';

class SearchDestScreen extends StatelessWidget {
  SearchDestScreen({
    super.key,
    required this.products,
    this.fromNavMenu = false,
    required this.query,
  });

  final List<ProductEntity> products;
  final bool fromNavMenu;
  final String query;

  final items = [
    'Sort from A-Z',
    'Sort from Z-A',
    'Sort by price descending',
    'Sort by price ascending',
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(ClearProductsEvent());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchAppbar(fromNavMenu: fromNavMenu),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          query.length == 0
              ? Text('')
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Results For \"${query}\"',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SortButton(items: items, products: products),
                FilterButton(query: query),
              ],
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              final displayProducts =
                  (state is ProductsLoaded && state.products.isNotEmpty)
                  ? state.products
                  : products;

              return displayProducts.isEmpty
                  ? Center(child: Text("No products found"))
                  : SearchItemsGrid(products: displayProducts);
            },
          ),
        ],
      ),
    );
  }
}
