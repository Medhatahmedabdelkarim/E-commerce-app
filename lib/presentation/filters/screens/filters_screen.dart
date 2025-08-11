import 'package:demo_app/constants/colors.dart';
import 'package:demo_app/data/models/category.dart';
import 'package:demo_app/presentation/filters/widgets/filters_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../domain/entities/category_entity.dart';
import '../../cart/widgets/blue_button.dart';
import '../../../services/api_services.dart';
import '../manager/filters_bloc.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.query});

  final String query;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String? selectedItem;
  int price = 0;

  @override
  void initState() {
    super.initState();
    context.read<FiltersBloc>().add(LoadCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FiltersAppBar(
        onPressed: () {
          setState(() {
            selectedItem = null;
            price = 0;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<FiltersBloc, FiltersState>(
        builder: (context, state) {
          if (state is FiltersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesLoaded) {
            return _buildFilterList(state.categories);
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: BlueButton(
        onPressed: () {
          final categoryId = selectedItem != null
              ? (context.read<FiltersBloc>().state as CategoriesLoaded)
                    .categories
                    .firstWhere(
                      (c) => c.name == selectedItem,
                      orElse: () => CategoryEntity(id: -1, name: '', image: ''),
                    )
                    .id
              : null;
          Get.back(
            result: {
              'categoryId': categoryId,
              'minPrice': 1,
              'maxPrice': price > 0 ? price.toDouble() : null,
              'title': null,
            },
          );
        },
      ),
    );
  }

  Widget _buildFilterList(List<CategoryEntity> categories) {
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
        _expansionTile('Color'),
        Divider(
          indent: 20,
          endIndent: 20,
          color: Color.fromRGBO(212, 214, 221, 1),
        ),
        _expansionTile('Size'),
        Divider(
          indent: 20,
          endIndent: 20,
          color: Color.fromRGBO(212, 214, 221, 1),
        ),
        _expansionTile('Customer Review'),
        Divider(
          indent: 20,
          endIndent: 20,
          color: Color.fromRGBO(212, 214, 221, 1),
        ),
      ],
    );
  }

  Widget _expansionTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Padding priceRange() {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
      child: ExpansionTile(
        trailing: price != 0
            ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: EColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null,
        title: const Text(
          'Price Range',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        children: [
          Column(
            children: [
              Slider(
                activeColor: EColors.primary,
                inactiveColor: const Color.fromRGBO(229, 232, 255, 1),
                label: "Select Max Price",
                value: price.toDouble(),
                onChanged: (value) {
                  setState(() {
                    price = value.toInt();
                  });
                },
                min: 0,
                max: 300,
              ),
              Text(
                "Max price: \$${price.toString()}",
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding categoryTile(List<CategoryEntity> categories) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
      child: ExpansionTile(
        title: const Text('Category'),
        trailing: selectedItem != null
            ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: EColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
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
                      selectedItem = isSelected ? null : item.name;
                    });
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? EColors.primary
                          : const Color.fromRGBO(229, 232, 255, 1),
                      border: Border.all(
                        color: isSelected
                            ? EColors.primary
                            : const Color.fromRGBO(229, 232, 255, 1),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : EColors.primary,
                        fontWeight: FontWeight.w600,
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
