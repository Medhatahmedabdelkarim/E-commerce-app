import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Category.dart';

class CategoriesDesign extends StatelessWidget {
  const CategoriesDesign({
    super.key,required this.category
  });
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.all(8),
        child:Column(children: [ Container(
          width:40,
          height:40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),

          ),
          child:InkWell(onTap: (){},child:Center(child:Image(image: AssetImage(category.imageUrl),fit: BoxFit.cover,)
            ,)),

        ),
          SizedBox(height: 4,),
          Text(category.title,style: TextStyle(fontWeight: FontWeight.bold),)

        ])
    );
  }
}