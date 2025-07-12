import 'package:demo_app/common_ui/Widgets/IncDec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItemsBloc = context.read<CartBloc>();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return Scaffold(appBar: AppBar(
            title: Text('Shopping Cart'),
          ),body: Center(child: Text('Cart is empty')));
        }
        else {
          double sum = state.items
              .map((item) => item.price)
              .reduce((a, b) => a + b);
          return
            Scaffold(
              appBar: AppBar(
                title: Text('Shopping Cart'),
                leading: BackButton(),
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

      });
  }

  Padding cartItemCard(CartState state, CartBloc cartItemsBloc) {
    return Padding(
              padding: EdgeInsets.all(12),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.items.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      title: Text('${state.items[index].title}'),
                      subtitle: Text('${state.items[index].price}'),
                      trailing: IncDec(cartItemsBloc: cartItemsBloc, product: state.items[index]),
                      leading: Card(
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
            );
  }
}

