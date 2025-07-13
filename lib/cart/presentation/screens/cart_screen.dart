import 'package:demo_app/common_ui/Widgets/IncDec.dart';
import 'package:demo_app/product_details/presentation/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
          double sum = state.items.fold<double>(
            0,
            (a, b) => a + b.price * b.count,
          );
          return Scaffold(
            appBar: AppBar(
              title: Text('Shopping Cart'),
              leading: BackButton(),
              actions: [
                IconButton(
                  onPressed: () {
                    cartItemsBloc.add(
                      ClearCart(),
                    );
                  },
                  icon: Icon(Icons.clear_all),
                ),
              ],
            ),
            body: cartItemCard(state, cartItemsBloc),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Total : $sum'),
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
          subtitle: Text('${state.items[index].price}'),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IncDec(
                cartItemsBloc: cartItemsBloc,
                product: state.items[index],
              ),
              IconButton(onPressed: (){cartItemsBloc.add(DeleteSpecificProduct(state.items[index]));}, icon: Icon(Icons.delete))
            ],
          ),
          leading: InkWell(
            onTap: (){Get.to(()=>ProductDetails(product: state.items[index]));},
            child: Card(
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                state.items[index].imageUrl,
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
