import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_ui/manager/product_bloc.dart';
import '../../../data/models/product.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key, required this.items, required this.products});

  final List<String> items;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Color.fromRGBO(197, 198, 204, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: AssetImage("assets/Images/Icon (1).png")),
            SizedBox(width: 8),
            SizedBox(
              width: 40,
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return DropdownButton(
                    items: items.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (value) {
                      context.read<ProductBloc>().add(
                        SortProductsEvent(
                          state is ProductsLoaded && state.products.isNotEmpty
                              ? state.products
                              : products,
                          value!,
                        ),
                      );
                    },
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    iconSize: 10,
                    isExpanded: true,
                    hint: Text('Sort', style: TextStyle(color: Colors.black)),
                    underline: Text(''),
                    menuWidth: 120,
                    isDense: false,
                    icon: ImageIcon(AssetImage("assets/Images/Arrow Down.png")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
