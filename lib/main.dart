import 'package:demo_app/Screens/ProductDetails.dart';
import 'package:demo_app/Screens/mimic.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Scaffold(
        body: ProductDetails(),
      ),
    )
  );
}


