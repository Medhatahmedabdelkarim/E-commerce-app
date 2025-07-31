import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/services/service_locator.dart' as di;
import 'package:demo_app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

import 'Search/presentation/manager/search_bloc.dart';
import 'common_ui/manager/product_bloc.dart';
import 'filter/presentation/managers/filters_bloc.dart';
import 'navigation/Bloc/navigation_bloc.dart';

void main() async {
  di.ServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox('cart');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (BuildContext context) => CartBloc()),
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (BuildContext context) => SearchBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
        BlocProvider<FilterBloc>(
          create: (BuildContext context) => FilterBloc(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SplashScreen()),
      ),
    ),
  );
}
