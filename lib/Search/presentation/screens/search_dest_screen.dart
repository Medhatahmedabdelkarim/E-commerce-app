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

class SearchDestScreen extends StatelessWidget {
  SearchDestScreen({super.key, required this.products});

  final List<Product> products;
  final items = [
    'Sort from A-Z',
    'Sort from Z-A',
    'Sort by price descending',
    'Sort by price ascending',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchAppbar(),

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
                          child: DropdownButton(
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items,),
                              );
                            }).toList(),
                            onChanged: (value) {
                              context.read<ProductBloc>().add(
                                SortProductsEvent(products, value!),
                              );
                            },
                            style: TextStyle(fontSize: 12,color: Colors.black),
                            iconSize: 10,
                            isExpanded: true,
                            hint: Text('Sort',style: TextStyle(color: Colors.black),),
                            underline: Text(''),
                            menuWidth: 120,
                            isDense: false,
                            icon: ImageIcon(
                              AssetImage("assets/Images/Arrow Down.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>Get.to(()=>FiltersScreen()),
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
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              List<Product> sortedProducts= state is ProductsLoaded? state.products :products;
              context.read<ProductBloc>().add(ClearProductsEvent());
              return SearchItemsGrid(products: sortedProducts);
            },
          ),
        ],
      ),
    );
  }
}
