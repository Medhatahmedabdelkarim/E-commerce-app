import 'package:demo_app/presentation/cart/manager/cart_bloc.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/presentation/home/manager/home_bloc.dart';
import 'package:demo_app/presentation/product_details/manager/product_details_bloc.dart';
import 'package:demo_app/services/service_locator.dart' as di;
import 'package:demo_app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

import 'presentation/search/manager/search_bloc.dart';
import 'presentation/categories/manager/categories_bloc.dart';
import 'common_ui/manager/product_bloc.dart';
import 'presentation/favorites/manager/favorites_bloc.dart';
import 'presentation/filters/manager/filters_bloc.dart';
import 'presentation/naviagation/manager/navigation_bloc.dart';

void main() async {
  await di.ServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox('cart');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (_) => di.sl<CartBloc>()),
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
        BlocProvider<FavoritesBloc>(create: (_) => di.sl<FavoritesBloc>()),

        BlocProvider<CategoriesBloc>(
          create: (BuildContext context) => CategoriesBloc(),
        ),
        BlocProvider<HomeBloc>(create: (_) => di.sl<HomeBloc>()),
        BlocProvider<ProductDetailsBloc>(create: (_) => di.sl<ProductDetailsBloc>()),

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SplashScreen()),
      ),
    ),
  );
}
