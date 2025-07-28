import 'package:demo_app/Search/presentation/widgets/search_app_bar.dart';
import 'package:demo_app/Search/presentation/widgets/search_items_grid.dart';
import 'package:demo_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product.dart';

class SearchDestScreen extends StatelessWidget {
  SearchDestScreen({super.key, required this.products});

  final List<Product> products;

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
                  width: 87,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Color.fromRGBO(197, 198, 204, 1),
                    ),
                    color: Color.fromRGBO(242, 243, 245, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/Images/Icon (1).png")),
                        Text("Sort"),
                        DropdownButton(
                          items: [],
                          onChanged: (value) {},
                          iconSize: 10,
                          isDense: false,
                          icon: ImageIcon(
                            AssetImage("assets/Images/Arrow Down.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 102,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Color.fromRGBO(197, 198, 204, 1),
                    ),
                    color: Color.fromRGBO(242, 243, 245, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                      right: 8,
                      bottom: 8,
                    ),
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
              ],
            ),
          ),
          SearchItemsGrid(products: products),
        ],
      ),
    );
  }
}
