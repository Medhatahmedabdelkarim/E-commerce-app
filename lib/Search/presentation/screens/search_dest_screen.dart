import 'package:demo_app/Search/presentation/widgets/search_app_bar.dart';
import 'package:demo_app/Search/presentation/widgets/search_items_grid.dart';
import 'package:demo_app/constants/colors.dart';
import 'package:demo_app/filter/presentation/screens/filters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common_ui/manager/product_bloc.dart';
import '../../../data/models/product.dart';
import '../../../navigation/Bloc/navigation_bloc.dart';

class SearchDestScreen extends StatelessWidget {
  SearchDestScreen(
      {super.key, required this.products, this.fromNavMenu = false,});

  final List<Product> products;
  final bool fromNavMenu;


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
    var productBloc = context.read<ProductBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchAppbar(fromNavMenu: fromNavMenu,),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Color.fromRGBO(197, 198, 204, 1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(image: AssetImage("assets/Images/Icon (1).png")),
                        SizedBox(width: 8,),
                        SizedBox(
                          width: 40,
                          child: BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, state) {
                              return DropdownButton(
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  context.read<ProductBloc>().add(
                                    SortProductsEvent(
                                        state is ProductsLoaded && state.products.isNotEmpty?state.products:products,
                                        value!),
                                  );
                                },
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                iconSize: 10,
                                isExpanded: true,
                                hint: Text('Sort',
                                  style: TextStyle(color: Colors.black),),
                                underline: Text(''),
                                menuWidth: 120,
                                isDense: false,
                                icon: ImageIcon(
                                  AssetImage("assets/Images/Arrow Down.png"),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final filters = await Get.to(() => FiltersScreen());
                    if (filters != null && filters is Map<String, dynamic>) {
                      context.read<ProductBloc>().add(
                          FilterProductsEvent(
                            categoryId: filters['categoryId'],
                            minPrice: (filters['minPrice'] as num?)?.toDouble(),
                            maxPrice: (filters['maxPrice'] as num?)?.toDouble(),
                            title: filters['title'],
                          )
                      );
                    }
                  },
                  child: Container(
                    height: 36,
                    width: 102,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Color.fromRGBO(197, 198, 204, 1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(image: AssetImage("assets/Images/Filter.png")),
                          Text("Filter", style: TextStyle(fontSize: 12)),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: EColors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              final displayProducts = (state is ProductsLoaded &&
                  state.products.isNotEmpty)
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
