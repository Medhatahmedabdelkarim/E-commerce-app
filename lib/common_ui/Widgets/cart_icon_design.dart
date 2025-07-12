import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartIconDesign extends StatelessWidget {
  CartIconDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final total = state.items.fold(0, (sum, item) => sum + item.count);
        return Stack(
          children: [
            IconButton(onPressed: () {Get.to(()=>CartScreen());}, icon: Icon(Icons.shopping_cart,)),
            Positioned(
              right: 0,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Center(
                  child: Text('${total}', style: TextStyle(color: Colors.white),),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}