import 'package:demo_app/common_ui/Widgets/IncDec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../product_details/presentation/screens/product_details.dart';
import '../../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItemsBloc = context.read<CartBloc>();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: Text('Shopping Cart')),
            body: Center(child: Text('Cart is empty')),
          );
        } else {
          double sum = cartItemsBloc.totalPrice();
          return Scaffold(
            appBar: AppBar(
              title: Text('Shopping Cart'),
              actions: [
                IconButton(
                  onPressed: () {
                    cartItemsBloc.add(ClearCart());
                  },
                  icon: Icon(Icons.delete, color: Colors.black),
                ),
              ],
            ),
            body: cartItemCard(state, cartItemsBloc),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.blue,
                ),
                child: Center(
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    child: Text(
                      'Total Price : \$$sum',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Padding cartItemCard(CartState state, CartBloc cartItemsBloc) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${state.items[index].title}'),
          subtitle: Text(
            '\$${state.items[index].price * state.items[index].count}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IncDec(cartItemsBloc: cartItemsBloc, product: state.items[index],onDecPressed: (){cartItemsBloc.add(RemoveFromCart(state.items[index]));},onIncPressed: (){cartItemsBloc.add(AddToCart(state.items[index]));},),
              IconButton(
                onPressed: () {
                  cartItemsBloc.add(DeleteSpecificProduct(state.items[index]));
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          leading: InkWell(
            onTap: () {
              Get.to(() => ProductDetails(product: state.items[index]));
            },
            child: Card(
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                state.items[index].images[0],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
