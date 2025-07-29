import 'package:demo_app/Search/presentation/screens/search_screen.dart';
import 'package:demo_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class FiltersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FiltersAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text('Filter',style: TextStyle(fontSize: 14),),
      centerTitle: true,
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(onTap:(){},child: Text('Cancel',style: TextStyle(fontSize: 12,color: EColors.primary,fontWeight: FontWeight.w600),)),
      ),

      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(onTap:(){},child: Text('Clear All',style: TextStyle(fontSize: 12,color: EColors.primary,fontWeight: FontWeight.w600),)),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(72);
}