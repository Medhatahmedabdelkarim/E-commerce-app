import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset("assets/Images/shopping.png"),
            ),
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
  }
}