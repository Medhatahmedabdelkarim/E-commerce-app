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
          alignment: Alignment.bottomRight,
          children: [
            IconButton(onPressed: () {Get.to(()=>CartScreen());}, icon: Icon(Icons.shopping_bag_outlined,),iconSize:24,),
            Positioned(
              right: 6,
              bottom: 6,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Color.fromRGBO( 0,25,255,1),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text('${total}', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}