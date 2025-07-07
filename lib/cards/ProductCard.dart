import 'package:demo_app/Screens/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8)),
        child:
        InkWell(
            onTap: ()=>Get.to(()=>ProductDetails(product: product,),),
            child:Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
                children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey,
              child: Image.asset(product.imageUrl,fit: BoxFit.cover,),
            ),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))


          ]
            ),

            Container(
                color: Colors.white.withValues(alpha: 0.2),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title,style:TextStyle(fontWeight:FontWeight.bold),),
                      SizedBox(height: 1,),
                      Text(product.price),


                    ],
                  ),
                )

            )
          ],
        )
    ),


    );
  }
}