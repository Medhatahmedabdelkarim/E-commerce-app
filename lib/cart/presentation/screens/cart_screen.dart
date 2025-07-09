
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme
        .of(context)
        .brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce'),
        leading: BackButton(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(12),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.items.length,
              itemBuilder: (context, index) =>
                      ListTile(
                        title: Text('${state.items[index].title}'),
                        subtitle: Text('${state.items[index].price}'),
                        trailing: Text('${state.items[index].count}'),

                      )
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: ElevatedButton(onPressed: () {
        }, child: Text('Checkout \$2800')),
      ),
    );
  }
}