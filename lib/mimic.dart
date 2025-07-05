import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Lists/CategoriesListView.dart';
import 'cards/HomeCards.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(8),
        child:Scaffold(
            appBar: AppBar(
              title: Center(child:Text('E-commerce')),
            ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
          child:
      Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      SizedBox(height:12),
      Text('Featured',style:TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8,),
        CardDesign(),
        SizedBox(height: 12,),

        Text('Categories',style:TextStyle(fontWeight: FontWeight.bold) ,),
        SizedBox(height: 10,),
        CategoriesListView(),
         SizedBox(height: 12,),
         Text('All Products',style:TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12,),
            SizedBox(
              height:600 ,
              child:GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder:(Context,position){
                  return Card(
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8)),
                    child:
                        Column(
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              color: Colors.grey,
                              child: Image.asset("assets/Images/mimic.png",fit: BoxFit.cover,),
                            ),
                            Container(
                                color: Colors.white.withValues(alpha: 0.2),
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Sleek boxing gloves',style:TextStyle(fontWeight:FontWeight.bold),),
                                    SizedBox(height: 1,),
                                    Text('27.00')

                                  ],
                                ),
                            )

                            )
                          ],
                        )


                  );
                },

              ),
            )



          ])
      )));
  }
}



