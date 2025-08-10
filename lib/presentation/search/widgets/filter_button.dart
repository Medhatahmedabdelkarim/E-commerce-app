import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../common_ui/manager/product_bloc.dart';
import '../../../constants/colors.dart';
import '../../filters/screens/filters_screen.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key, required this.query});

  final String query;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final filters = await Get.to(() => FiltersScreen(query: widget.query));
        if (filters != null && filters is Map<String, dynamic>) {
          context.read<ProductBloc>().add(
            FilterProductsEvent(
              categoryId: filters['categoryId'],
              minPrice: (filters['minPrice'] as num?)?.toDouble(),
              maxPrice: (filters['maxPrice'] as num?)?.toDouble(),
              title: widget.query,
            ),
          );
        }
        setState(() {
          count = 0;
          if (filters['categoryId'] != null) {
            count++;
          }
          if (filters['maxPrice'] != null) {
            count++;
          }
        });
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
                    '$count',
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
    );
  }
}
