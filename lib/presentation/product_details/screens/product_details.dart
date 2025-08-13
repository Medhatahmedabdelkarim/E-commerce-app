import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_ui/cards/product_details_card.dart';
import '../../../constants/colors.dart';
import '../../../dependency_injection/service_locator.dart';
import '../../cart/manager/cart_bloc.dart';
import '../../favorites/manager/favorites_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../product_details/manager/product_details_bloc.dart';


class ProductDetails extends StatelessWidget {
  final int productId;

  const ProductDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      sl<ProductDetailsBloc>()..add(LoadProductDetails(productId)),
      child: Scaffold(
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailsError) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is ProductDetailsLoaded) {
              final product = state.product;
              return _productDetailsUi(context, product);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _productDetailsUi(BuildContext context, ProductEntity product) {
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
                  // Title & Favorite Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      BlocBuilder<FavoritesBloc, FavoritesState>(
                        builder: (context, state) {
                          final favoritesBloc = context.read<FavoritesBloc>();
                          final isFavorited = state.items.any((item) => item.id == product.id);

                          return GestureDetector(
                            onTap: () {
                              if (!isFavorited) {
                                favoritesBloc.add(AddToFavorites(product));
                              } else {
                                favoritesBloc.add(RemoveFromFavorites(product));
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
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 40),
                  const Text(
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
                  const Text(
                    "Colors  ",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: Image.asset('assets/Images/Colours.png'),
                  ),
                  const SizedBox(height: 40),
                  _addToCartButton(context, product),
                ],
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ],
    );
  }

  Widget _addToCartButton(BuildContext context, ProductEntity product) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final cartBloc = context.read<CartBloc>();
        final inCart = state.items.any((item) => item.id == product.id);

        if (!inCart) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: EColors.primary,
            ),
            child: TextButton(
              onPressed: () => cartBloc.add(AddToCart(product)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
          );
        } else {
          final productInCart = state.items.firstWhere((item) => item.id == product.id);
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: EColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => cartBloc.add(RemoveFromCart(product)),
                    child: const Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                Text(
                  '${productInCart.count}',
                  style: const TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => cartBloc.add(AddToCart(product)),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
