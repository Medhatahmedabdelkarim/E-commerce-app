import 'package:demo_app/Search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../favorites/presentation/screens/favorites_screen.dart';
import 'cart_icon_design.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Image.asset("assets/Images/CasaForsa.png"),
      centerTitle: true,
      leading: GestureDetector(
        child: Container(
          height: 36,
          width: 36,
          child: GestureDetector(
            onTap: () => Get.to(() => SearchScreen(fromNavMenu: false)),
            child: ImageIcon(AssetImage('assets/Images/Search.png')),
          ),
        ),
      ),

      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap:()=>Get.to(()=>FavoritesScreen()),
                child: Container(
                  height: 36,
                  width: 36,
                  child: Image.asset('assets/Images/Heart Outlined.png'),
                ),
              ),
              CartIconDesign(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(72);
}
