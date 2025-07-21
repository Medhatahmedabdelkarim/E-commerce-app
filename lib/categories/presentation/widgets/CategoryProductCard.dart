// import '../../product_details/presentation/product_details.dart';
import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/common_ui/Widgets/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 8),
      child: InkWell(
        onTap: () {},
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
                      child: Image.asset(
                        "assets/Images/jordan_Luka.jpg",
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
                            'Jordan Luka 1',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$ 2000.0',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
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
                              onPressed: () {},
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: EColors.primary,
                                ),
                              ),
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
