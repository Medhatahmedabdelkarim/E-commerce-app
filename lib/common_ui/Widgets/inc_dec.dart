import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';
import '../../presentation/cart/manager/cart_bloc.dart';
import '../../constants/colors.dart';
import '../../data/models/product.dart';

class IncDec extends StatelessWidget {
  const IncDec({
    super.key,
    required this.cartItemsBloc,
    required this.product,
    required this.onDecPressed,
    required this.onIncPressed,
  });

  final CartBloc cartItemsBloc;
  final ProductEntity product;
  final VoidCallback onIncPressed;
  final VoidCallback onDecPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Text(
            '${cartItemsBloc.state.items.firstWhere((item) => item.id == product.id, orElse: () => product).count}',
            style: TextStyle(color: Colors.black),
          ),
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
