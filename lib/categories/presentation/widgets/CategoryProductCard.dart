// import '../../product_details/presentation/product_details.dart';
import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/categories/presentation/widgets/IncDecCategoryProduct.dart';
import 'package:demo_app/common_ui/Widgets/IncDec.dart';
import 'package:demo_app/common_ui/Widgets/circular_icon.dart';
import 'package:demo_app/product_details/presentation/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../data/models/product.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 8),
      child: InkWell(
        onTap: () {Get.to(()=>ProductDetails(productId: product.id));},
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
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 120,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Image.network(
                        product.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 7.5,
                      child: GestureDetector(
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            'assets/Images/Heart Outlined.png',
                            color: EColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
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
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$ ${product.price}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 16),
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
                                  : IncDecCategoryproduct(
                                      cartItemsBloc: cartItemsBloc,
                                      product: product,
                                      onDecPressed: () {
                                        cartItemsBloc.add(
                                          RemoveFromCart(product),
                                        );
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
