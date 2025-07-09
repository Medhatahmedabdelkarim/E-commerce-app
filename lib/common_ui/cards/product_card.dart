// import '../../product_details/presentation/product_details.dart';
import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/common_ui/Widgets/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../../product_details/presentation/screens/product_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    product.count = 1;
    final cartItemsBloc = context.read<CartBloc>();
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => Get.to(() => ProductDetails(product: product)),
        child: Column(
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                bool check = !(state.items
                    .map((item) => item.title)
                    .contains(product.title));
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                    ),
                    check
                        ? IconButton(
                            onPressed: () {
                              cartItemsBloc.add(AddToCart(product));
                            },
                            icon: Icon(Icons.shopping_cart),
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
                                      cartItemsBloc.add(
                                        RemoveFromCart(product),
                                      );
                                      if (product.count == 1) {
                                        return;
                                      } else {
                                        product.count--;
                                      }

                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
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
                          ),
                  ],
                );
              },
            ),

            Container(
              color: Colors.white.withValues(alpha: 0.2),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
