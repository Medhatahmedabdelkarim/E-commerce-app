import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SplashController>(
        init:SplashController(),
        builder:(context) {
      return Container(
        color: Colors.blue,
        height: 1000,
        width: 1000,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/Images/shopping.png"),
              ),
              Text("E-commerce App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
              ),

              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      );
    });
  }
}
