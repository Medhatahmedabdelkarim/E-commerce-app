import 'package:demo_app/presentation/search/screens/search_dest_screen.dart';
import 'package:demo_app/presentation/categories/screens/categories_main_screen.dart';
import 'package:demo_app/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/colors.dart';
import '../../home/screens/home_screen.dart';
import '../manager/navigation_bloc.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  late NavigationBloc _navigationBloc;

  @override
  void initState() {
    super.initState();
    _navigationBloc = context.read<NavigationBloc>();
  }

  Future<bool> _onWillPop() async {
    final currentNavigatorState = _navigatorKeys[_navigationBloc.state.tabIndex].currentState!;
    if (currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: IndexedStack(
              index: state.tabIndex,
              children: [
                _buildNavigator(0, HomeScreen()),
                _buildNavigator(1, SearchDestScreen(products: [], fromNavMenu: true,query: '',)),
                _buildNavigator(2, CategoriesMainScreen()),
                _buildNavigator(3, const ProfileScreen()),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.tabIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedIconTheme: const IconThemeData(color: EColors.primary),
              selectedItemColor: Colors.black,
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              onTap: (index) {
                _navigationBloc.add(OnChangeNav(tabIndex: index));
              },
              items: const [
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
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => child),
    );
  }
}

