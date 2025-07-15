import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../data/models/product.dart';

class IncDec extends StatelessWidget {
  const IncDec({
    super.key,
    required this.cartItemsBloc,
    required this.product,
    required this.onDecPressed,
    required this.onIncPressed
  });

  final CartBloc cartItemsBloc;
  final Product product;
  final VoidCallback onIncPressed;
  final VoidCallback onDecPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap:onDecPressed,
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            '${cartItemsBloc.state.items.firstWhere(
                    (item) => item.title == product.title,
                orElse: () => product
            ).count}',
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap:onIncPressed,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}