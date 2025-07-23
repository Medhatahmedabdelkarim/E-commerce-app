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
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Your Bag',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              centerTitle: true,
            ),
            body: Center(child: Text('Cart is empty')),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Your Bag',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              centerTitle: true,
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
            bottomNavigationBar: cartNavigationBar(cartItemsBloc)
          );
        }
      },
    );
  }

  Container cartNavigationBar(CartBloc cartItemsBloc) {
    return Container(
            height: 136,
            child: Padding(
              padding: const EdgeInsets.only(top:12,right: 24,left: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8,right: 12,left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: TextStyle(fontSize: 14),),
                        Text('\$ ${cartItemsBloc.totalPrice()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),)
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: 360,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(0, 25, 255, 1),
                    ),
                    child: TextButton(
                      onPressed: () {
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Checkout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Padding cartItemCard(CartState state, CartBloc cartItemsBloc) {
    return Padding(
      padding: EdgeInsets.only(top:24,bottom: 12,right: 24,left: 24),
      child: ListView.separated(
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.only(top:12,bottom: 12),
          child: Divider(color: Color.fromRGBO(212,214,221, 1),thickness: 0.5,),
        ),
        shrinkWrap: true,
        itemCount: state.items.length,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 90,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromRGBO(248, 249, 254, 1),
            ),
                child: Image.network(
                    state.items[index].images[0],
                    fit: BoxFit.cover
                ),
              ),
          ),
              Padding(
                padding: EdgeInsets.only(top: 12,bottom: 12,right: 16,left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 237,
                      child: Text(
                        '${state.items[index].title}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ),
                    ),
                    Text(
                      'Blue / 160x200',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 9,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncDec(cartItemsBloc: cartItemsBloc, product: state.items[index], onDecPressed: (){cartItemsBloc.add(RemoveFromCart(state.items[index]));}, onIncPressed: (){cartItemsBloc.add(AddToCart(state.items[index]));}),
                        SizedBox(width:108),
                        Text(
                          '\$ ${state.items[index].price * state.items[index].count}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
