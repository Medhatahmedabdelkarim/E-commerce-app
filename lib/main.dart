import 'package:demo_app/cart/bloc/cart_bloc.dart';
import 'package:demo_app/services/service_locator.dart' as di;
import 'package:demo_app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
      ],
      child: GetMaterialApp(home: Scaffold(body: SplashScreen()))));
}
