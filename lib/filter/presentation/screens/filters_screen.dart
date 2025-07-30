import 'package:demo_app/constants/colors.dart';
import 'package:demo_app/data/models/category.dart';
import 'package:demo_app/filter/presentation/widgets/filters_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../cart/presentation/widgets/blue_button.dart';
import '../../../services/api_services.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String? selectedItem;
  late Future<List<Category>> _categoriesFuture;
  int price = 0;
  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );

  @override
  void initState() {
    super.initState();
    _categoriesFuture = apiService.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FiltersAppBar(),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("Product not found"));
          } else {
            final List<Category> categories = snapshot.data!;
            return ListView(
              children: [
                categoryTile(categories),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(212, 214, 221, 1),
                ),
                priceRange(),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(212, 214, 221, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                  child: ExpansionTile(
                    title: Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(212, 214, 221, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                  child: ExpansionTile(
                    title: Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(212, 214, 221, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                  child: ExpansionTile(
                    title: Text(
                      'Customer Review',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(212, 214, 221, 1),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BlueButton(),
    );
  }

  Padding priceRange() {
    return Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                child: ExpansionTile(
                  trailing: price !=0
                      ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: EColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : null,
                  shape: Border(),
                  title: Text(
                    'Price Range',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Slider(
                          activeColor: EColors.primary,
                          inactiveColor:Color.fromRGBO(229, 232, 255, 1),
                          label: "Select Max Price",
                          value: price.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              price = value.toInt();
                            });
                          },
                          min: 0,
                          max: 10000,
                        ),
                        Text(
                          "Max price: \$ ${price.toString()}",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }

  Padding categoryTile(List<Category> categories) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
      child: ExpansionTile(
        shape: const Border(),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.topLeft,
        title: Text('Category'),
        trailing: selectedItem != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: EColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: categories.map((item) {
                final bool isSelected = selectedItem == item.name;
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedItem == item.name) {
                        selectedItem = null;
                      } else {
                        selectedItem = item.name;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? EColors.primary
                          : Color.fromRGBO(229, 232, 255, 1),
                      border: Border.all(
                        color: isSelected
                            ? EColors.primary
                            : Color.fromRGBO(229, 232, 255, 1),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : EColors.primary,
                        fontWeight:FontWeight.w600
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
