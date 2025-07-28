import 'package:demo_app/Search/presentation/screens/search_dest_screen.dart';
import 'package:demo_app/cart/presentation/screens/cart_screen.dart';
import 'package:demo_app/categories/presentation/screens/categories_main_screen.dart';
import 'package:demo_app/common_ui/Widgets/home_app_bar.dart';
import 'package:demo_app/profile/presentation/screens/profile_screen.dart';
import 'package:demo_app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../cart/bloc/cart_bloc.dart';
import '../../../constants/colors.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../Bloc/navigation_bloc.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationBlocs = context.read<NavigationBloc>();
    final screens = [
      HomeScreen(),
      SearchDestScreen(products: []),
      CategoriesMainScreen(),
    ];
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: HomeAppBar(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.tabIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(color: EColors.primary),
            selectedItemColor: Colors.black,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/Images/Icon.png')),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              NavigationBlocs.add(OnChangeNav(tabIndex: index));
            },
          ),
          body: screens[state.tabIndex],
        );
      },
    );
  }
}
