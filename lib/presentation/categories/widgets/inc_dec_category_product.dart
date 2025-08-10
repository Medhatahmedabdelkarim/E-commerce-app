import 'package:flutter/material.dart';
import '../../cart/manager/cart_bloc.dart';
import '../../../constants/colors.dart';
import '../../../data/models/product.dart';

class IncDecCategoryProduct extends StatelessWidget {
  const IncDecCategoryProduct({
    super.key,
    required this.cartItemsBloc,
    required this.product,
    required this.onDecPressed,
    required this.onIncPressed,
  });

  final CartBloc cartItemsBloc;
  final Product product;
  final VoidCallback onIncPressed;
  final VoidCallback onDecPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133.5,
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color.fromRGBO(229, 232, 255, 1),
            ),
            child: GestureDetector(
              onTap: onDecPressed,
              child: Icon(Icons.remove, color: EColors.primary, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${cartItemsBloc.state.items.firstWhere((item) => item.title == product.title, orElse: () => product).count}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color.fromRGBO(229, 232, 255, 1),
            ),
            child: GestureDetector(
              onTap: onIncPressed,
              child: Icon(Icons.add, color: EColors.primary, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
