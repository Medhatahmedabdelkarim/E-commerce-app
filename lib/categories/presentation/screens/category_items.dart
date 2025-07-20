import 'package:demo_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_ui/Widgets/cart_icon_design.dart';
import '../widgets/CategoriesItemsGrid.dart';
import '../widgets/CategoryItemAppBar.dart';

class CategoryItemsScreen extends StatelessWidget{
  CategoryItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CategoryItemAppbar(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 87,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5,color:Color.fromRGBO( 197,198,204,1) ),
                    color: Color.fromRGBO( 242, 243, 245,1),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,top: 8,right: 8,bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/Images/Icon (1).png")),
                        Text("Sort"),
                        DropdownButton(items: [], onChanged: (value){},iconSize: 10,isDense: false,icon: ImageIcon(AssetImage("assets/Images/Arrow Down.png")),)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 102,
                  height: 36,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5,color:Color.fromRGBO( 197,198,204,1) ),
                      color: Color.fromRGBO( 242, 243, 245,1),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,top: 8,right: 8,bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/Images/Filter.png")),
                        Text("Filter",style: TextStyle(fontSize: 12),),
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              color: EColors.primary,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text('2', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),),
                          ),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
          CategoriesItemsGrid(),
        ],
      ),
    );
  }

}


