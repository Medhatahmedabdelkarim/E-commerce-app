import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:demo_app/presentation/cart/manager/cart_bloc.dart';
import 'package:demo_app/presentation/categories/widgets/inc_dec_category_product.dart';
import 'package:demo_app/presentation/product_details/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/colors.dart';
import '../../../data/models/product.dart';
import '../../favorites/manager/favorites_bloc.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductDetails(productId: product.id),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 241,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromRGBO(248, 249, 254, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [topPartCard(), bottomPartCard()],
            ),
          ),
        ),
      ),
    );
  }

  Expanded bottomPartCard() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: 121,
          width: 165.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              Text(
                '\$ ${product.price}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final cartItemsBloc = context.read<CartBloc>();
                  bool check = !(state.items
                      .map((item) => item.id)
                      .contains(product.id));
                  return check
                      ? Container(
                          width: 133.5,
                          height: 36,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: EColors.primary,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              cartItemsBloc.add(AddToCart(product));
                            },
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: EColors.primary,
                              ),
                            ),
                          ),
                        )
                      : IncDecCategoryProduct(
                          cartItemsBloc: cartItemsBloc,
                          product: product,
                          onDecPressed: () {
                            cartItemsBloc.add(RemoveFromCart(product));
                          },
                          onIncPressed: () {
                            cartItemsBloc.add(AddToCart(product));
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack topPartCard() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 120,
          width: 170,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: Image.network(product.images[0], fit: BoxFit.cover),
        ),
        Positioned(
          top: 12,
          right: 7.5,
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              final FavoritesItemsBloc = context.read<FavoritesBloc>();
              final isFavorited = state.items.any((item) => item.id == product.id);
              return GestureDetector(
                onTap: () {
                  if (!isFavorited) {
                    FavoritesItemsBloc.add(AddToFavorites(product));
                  } else {
                    FavoritesItemsBloc.add(RemoveFromFavorites(product));
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
        ),
      ],
    );
  }
}
