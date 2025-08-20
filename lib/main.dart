import 'package:demo_app/presentation/cart/manager/cart_bloc.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/presentation/categories/manager/main_categories_bloc/categories_list_bloc.dart';
import 'package:demo_app/presentation/home/manager/home_bloc.dart';
import 'package:demo_app/presentation/product_details/manager/product_details_bloc.dart';
import 'package:demo_app/dependency_injection/service_locator.dart' as di;
import 'package:demo_app/presentation/sign_in/manager/auth_bloc.dart';
import 'package:demo_app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

import 'presentation/search/manager/search_bloc.dart';
import 'presentation/categories/manager/category_product_bloc/categories_bloc.dart';
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
        BlocProvider<SearchBloc>(create: (_) => di.sl<SearchBloc>()),

        BlocProvider<ProductBloc>(create: (_) => di.sl<ProductBloc>()),

        BlocProvider<FiltersBloc>(create: (_) => di.sl<FiltersBloc>()),

        BlocProvider<FavoritesBloc>(
          create: (_) => di.sl<FavoritesBloc>()..add(LoadFavorites()),
        ),

        BlocProvider<CategoriesListBloc>(
          create: (_) => di.sl<CategoriesListBloc>()..add(LoadCategories()),
        ),
        BlocProvider<CategoriesBloc>(create: (_) => di.sl<CategoriesBloc>()),

        BlocProvider<HomeBloc>(create: (_) => di.sl<HomeBloc>()),
        BlocProvider<ProductDetailsBloc>(
          create: (_) => di.sl<ProductDetailsBloc>(),
        ),
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()),

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SplashScreen()),
      ),
    ),
  );
}
