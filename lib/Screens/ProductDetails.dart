import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Product.dart';

class ProductDetails extends StatelessWidget{
  ProductDetails({super.key,required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("E-commerce"),leading: BackButton(),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.favorite))],),
      body: ListView(
        children: [
           Padding(padding: EdgeInsets.all(8),child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
          Card(
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8)),
          child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.white.withValues(alpha: 0.7),
                child: Image.asset(product.imageUrl),
              ),

          ),
              SizedBox(height: 8,),
              Text(product.title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 4,),
              Text(product.description,style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),

              Text("Price : ${product.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 12,),
              Text("Colors",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
              SizedBox(height: 5,),
              SizedBox(
                height:40,
                  child:ListView(
                      scrollDirection: Axis.horizontal,
                      children: [Container(
                    width:40,
                    height:30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red
                    ),
              ), SizedBox(width: 5,),
                    Container(
                      width:40,
                      height:30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue
                      ),
                    ),
                        SizedBox(width: 5,),
                    Container(
                      width:40,
                      height:30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green
                      ),
                    ),
                        SizedBox(width: 5,),
                    Container(
                      width:40,
                      height:30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.yellow
                      ),
                    ),
              ]
              ),



              ),

              SizedBox(height: 12,),

              SizedBox(height: 12,),
              Container(width:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),child:TextButton(onPressed: (){}, child:Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black)) ,)),
              SizedBox(height: 4,),
              Container(width:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),child:TextButton(onPressed: (){}, child:Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black)) ,)),
              SizedBox(height: 8,),
              Divider(),
              Text(" Reviews (300)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
              SizedBox(height: 4,),
              RatingBar(ratingWidget: RatingWidget(full: Icon(Icons.star,color: Colors.amber,),half: Icon(Icons.star,color: Colors.amber,),empty: Icon(Icons.star,color: Colors.grey,)),maxRating: 5,minRating: 1, onRatingUpdate: (value)=>print(value)),
            ],
          ),
    )
        ],

      ),
    );

  }
}