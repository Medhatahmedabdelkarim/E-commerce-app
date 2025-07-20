import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_ui/Widgets/cart_icon_design.dart';
import '../../../constants/colors.dart';

class CategoryItemAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryItemAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,top: 24),
      child: Container(
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
               ImageIcon(AssetImage("assets/Images/Left Button.png"),color: EColors.primary,),
               Container(
                width: 253,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color.fromRGBO( 229,232,255,1),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hint: Padding(
                        padding: const EdgeInsets.only(left:16,bottom:4,top:12),
                        child: Row(children: [ImageIcon(AssetImage("assets/Images/Search.png"),size: 16,),SizedBox(width: 16,),Text('Search',style: TextStyle(fontSize: 14),)]),
                      ),
                      border: InputBorder.none
                  ),
                ),
              ),

                Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 36,
                        width: 36,
                        child: Image.asset('assets/Images/Heart Outlined.png'),
                      ),
                    ),
                    CartIconDesign(),
                  ],
                ),
              ],
            ),
      ),
    );

  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(72);
}
