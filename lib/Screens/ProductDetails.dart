import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatelessWidget{
  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
     double rating=0.0;
    return Scaffold(
      appBar: AppBar(title: Text("E-commerce"),leading: BackButton(),),
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
                child: Image.asset("assets/Images/Formula1.png"),
              ),

          ),
              SizedBox(height: 8,),
              Text('Formula 1 Car', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 4,),
              Text("A Ferrari Formula 1 car, like the SF-25 unveiled in 2025, is a high-performance single-seater designed for the pinnacle of motorsport. It features a carbon fiber chassis, a powerful 1.6L V6 engine with hybrid technology, and advanced aerodynamic elements to maximize downforce. Key components include a halo device for driver protection, a semi-automatic gearbox, and sophisticated suspension and braking systems. ",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),

              Text("Price : \$2000",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
              ),
                        SizedBox(width: 5,),
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

              Text(" Reviews(300)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
              RatingBar(ratingWidget: RatingWidget(full: Icon(Icons.star,color: Colors.amber,),half: Icon(Icons.star,color: Colors.amber,),empty: Icon(Icons.star,color: Colors.grey,)),maxRating: 5,minRating: 1, onRatingUpdate: (value)=>print(value)),
              SizedBox(height: 12,),
              Container(width:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),child:TextButton(onPressed: (){}, child:Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black)) ,)),
              SizedBox(height: 4,),
              Container(width:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),child:TextButton(onPressed: (){}, child:Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black)) ,))
            ],
          ),
    )
        ],

      ),
    );

  }
}