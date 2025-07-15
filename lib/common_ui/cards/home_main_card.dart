import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  const CardDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:13,bottom: 13),
      child: Container(
            width: double.infinity,
            height: 214,
            child: Image.asset("assets/Images/Picture swipe.png",fit: BoxFit.cover,),
      ),
    );
  }
}
