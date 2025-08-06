import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/bloc/cart_bloc.dart';
import '../../../common_ui/cards/product_details_card.dart';
import '../../../constants/colors.dart';
import '../../../data/models/product.dart';
import 'package:flutter/material.dart';

import '../../../favorites/presentation/manager/favorites_bloc.dart';
import '../../../services/api_services.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Product>(
        future: apiService.getProductById(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("Product not found"));
          } else {
            final product = snapshot.data!;
            return productDetailsUi(context, product);
          }
        },
      ),
    );
  }

  Widget productDetailsUi(BuildContext context, Product product) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsCard(product: product),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      BlocBuilder<FavoritesBloc, FavoritesState>(
                        builder: (context, state) {
                          final FavoritesItemsBloc = context
                              .read<FavoritesBloc>();
                          final isFavorited = state.items.any(
                            (item) => item.id == product.id,
                          );

                          return GestureDetector(
                            onTap: () {
                              if (!isFavorited) {
                                FavoritesItemsBloc.add(AddToFavorites(product));
                              } else {
                                FavoritesItemsBloc.add(
                                  RemoveFromFavorites(product),
                                );
                              }
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              child: !isFavorited
                                  ? Image.asset(
                                      'assets/Images/Heart Outlined.png',
                                      color: EColors.primary,
                                    )
                                  : Image.asset(
                                      'assets/Images/Heart Filled.png',
                                      color: EColors.primary,
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$ ${product.price}",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Size",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: [Image.asset('assets/Images/Colours (1).png')],
                    ),
                  ),
                  const SizedBox(height: 32),

                  Text(
                    "Colors  ",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: Image.asset('assets/Images/Colours.png'),
                  ),
                  const SizedBox(height: 40),

                  addToCartButton(context, product),
                ],
              ),
            ),

            const SizedBox(height: 4),
          ],
        ),
      ],
    );
  }
}

BlocBuilder addToCartButton(BuildContext context, Product product) {
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
                color: EColors.primary,
              ),
              child: TextButton(
                onPressed: () {
                  cartItemsBloc.add(AddToCart(product));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
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
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: EColors.primary,
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
                    '${state.items.firstWhere((item) => item.title == product.title, orElse: () => product).count}',
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
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: CircleAvatar(backgroundColor: Colors.pink),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 20,
            left: 20,
            child: Container(
              height: 36,
              width: 36,
              child: Image.asset('assets/Images/Badge.png'),
            ),
          ),
        ],
      ),
      const SizedBox(width: 5),
      Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: CircleAvatar(backgroundColor: Colors.pink),
      ),
      const SizedBox(width: 5),
      Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: CircleAvatar(backgroundColor: Colors.pink),
      ),
      const SizedBox(width: 5),
      Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: CircleAvatar(backgroundColor: Colors.pink),
      ),
    ],
  );
}
