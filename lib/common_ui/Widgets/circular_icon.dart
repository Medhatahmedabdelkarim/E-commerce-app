import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,required this.text,required this.onPressed
  });

  final String text;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child:  TextButton(onPressed: onPressed, child: Text(text,style: TextStyle(color: Colors.black,fontSize: 8),))
    );
  }
}