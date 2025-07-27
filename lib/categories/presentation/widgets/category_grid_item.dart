import 'package:demo_app/categories/presentation/screens/category_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/models/category.dart';

class CategoryGridItem extends StatelessWidget{
CategoryGridItem({super.key,required this.category});

final Category category;

@override
Widget build(BuildContext context){
return InkWell(
    borderRadius:BorderRadius.circular(16),
    onTap: ()=>Get.to(()=>CategoryItemsScreen(categoryId: category.id,)),
    child: Container(
        padding:EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(image: Image.network(category.image,color: Colors.black.withValues(alpha: 0.2),).image,fit: BoxFit.cover,colorFilter: ColorFilter.mode(
    Colors.black.withValues(alpha: 0.3),
    BlendMode.darken))
        ),
        child:Center(child: Text(category.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.white),),),

    ),
  );
}
}