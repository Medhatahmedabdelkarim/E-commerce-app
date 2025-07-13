import 'package:demo_app/cart/presentation/screens/cart_screen.dart';
import 'package:demo_app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../navigation/navigation_bloc.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final NavigationBlocs = context.read<NavigationBloc>();
    final screens=[HomeScreen(),CartScreen()];
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: GNav(
                  onTabChange:(index){
                    NavigationBlocs.add(OnChangeNav(tabIndex: index));
                  },
                  activeColor: Colors.black,
                  tabBackgroundColor: Colors.blue.shade500,
                  padding: EdgeInsets.all(16),
                  gap: 8,
                  tabs: [
                    GButton(icon: Icons.home, text: 'home',),
                    GButton(icon: Icons.shopping_cart, text: 'cart',),
                    GButton(icon: Icons.favorite_border, text: 'favorite',),

                  ]),
            ),
          ),
          body:screens[state.tabIndex] ,
        );
      },
    );
  }
}
