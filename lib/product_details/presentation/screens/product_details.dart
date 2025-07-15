import 'package:demo_app/common_ui/Widgets/sizes_widget.dart';
import 'package:flutter/cupertino.dart';
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailsCard(product: product),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color:Color.fromRGBO(0, 25, 255, 1),size:24))
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "\$ ${product.price}",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    Text(
                      product.description,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Size",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 40, child: SizesWidget()),
                    SizedBox(height: 32),

                    Text(
                      "Colors : ",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 40, child: colorsSlider()),
                    SizedBox(height: 32),

                    addToCartButton(context),
                  ],
                ),
              ),

              SizedBox(height: 4),


            ],
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
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(0, 25, 255, 1),
                ),
                child: TextButton(
                  onPressed: () {
                    cartItemsBloc.add(AddToCart(product));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add,color: Colors.white,),
                      Text(
                        " Add To Cart",
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
            : Container(
                width:double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(0, 25, 255, 1),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          cartItemsBloc.add(RemoveFromCart(product));

                        },
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    Text(
                      '${state.items.firstWhere(
                              (item) => item.title == product.title,
                          orElse: () => product
                      ).count}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          cartItemsBloc.add(AddToCart(product));
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
        Stack(
          children:[ Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            child: CircleAvatar(
            backgroundColor:Colors.pink,
            ),
          ),
            Positioned(
              right: 0,
              top: -1,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Color.fromRGBO( 0,25,255,1),
                    borderRadius: BorderRadius.circular(20),
                    border:Border.all(color: Colors.white,
                        width: 2.0)
                ),
                child: Center(
                  child: Text('✓', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),),
                ),
              ),
            )
        ]),
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
