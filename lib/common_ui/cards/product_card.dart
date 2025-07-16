// import '../../product_details/presentation/product_details.dart';
import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/common_ui/Widgets/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../../product_details/presentation/screens/product_details.dart';
import '../../services/service_locator.dart';
import '../Widgets/IncDec.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var cartItemsBloc = context.read<CartBloc>();
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
      child: InkWell(
        onTap: () => Get.to(() => ProductDetails(productId: product.id)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 200,
            height: 189,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromRGBO(248, 249, 254, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Image.network(product.images[0], fit: BoxFit.cover,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 200,
                      height: 69,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product.title}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${product.price}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
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
