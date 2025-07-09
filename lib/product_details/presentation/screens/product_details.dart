import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/bloc/cart_bloc.dart';
import '../../../common_ui/Widgets/rating_bar.dart';
import '../../../common_ui/cards/product_details_card.dart';
import '../../../data/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce'),
        leading: BackButton(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsCard(product: product),
                SizedBox(height: 8),
                Text(
                  product.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 4),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),
                Text(
                  "Price : \$${product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 12),
                Text(
                  "Colors : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                SizedBox(height: 40, child: colorsSlider()),
                SizedBox(height: 20),

                addToCartButton(context),

                SizedBox(height: 4),
                buyNowButton(),
                SizedBox(height: 8),
                Divider(),
                Text(
                  " Reviews (300)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 4),
                RatingsBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buyNowButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Buy Now",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  BlocBuilder addToCartButton(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final cartItemsBloc = context.read<CartBloc>();
        bool check = !(state.items
            .map((item) => item.title)
            .contains(product.title));
        return check
            ? Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: TextButton(
                  onPressed: () {
                    cartItemsBloc.add(AddToCart(product));
                  },
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            : Container(
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
                        onTap: () {
                          cartItemsBloc.add(RemoveFromCart(product));
                          if(product.count==1) {
                            return;
                          }
                          else{
                            product.count--;
                          }
                        },
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    Text(
                      '${product.count}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          cartItemsBloc.add(AddToCart(product));
                          product.count++;
                        },
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  ListView colorsSlider() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.red,
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.green,
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
