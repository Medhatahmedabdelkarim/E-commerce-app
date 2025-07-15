import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/services/service_locator.dart' as di;
import 'package:demo_app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

import 'navigation/navigation_bloc.dart';

void main() async {
  di.ServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox('cart');
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
      ],
      child: GetMaterialApp(debugShowCheckedModeBanner: false,home: Scaffold(body: SplashScreen()))));
}
