import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizesWidget extends StatelessWidget{
  SizesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:24 ,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromRGBO( 0,25,255,1),
            ),
            child: Center(child: Text('160x200',style: TextStyle(color: Colors.white,fontSize: 10),),
          ),
          ),
          SizedBox(width: 8),
          Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromRGBO( 229,232,255,1),
            ),
            child: Center(child: Text('180x200',style: TextStyle(color:Color.fromRGBO( 0,25,255,1),fontSize: 10),),),
          ),
          SizedBox(width: 8),
          Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:Color.fromRGBO( 229,232,255,1) ,
            ),
            child: Center(child: Text('200x200',style: TextStyle(color: Color.fromRGBO( 0,25,255,1),fontSize: 10,),),
          ),
          ),
          SizedBox(width: 8),
          Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:Color.fromRGBO( 229,232,255,1),
            ),
            child: Center(child: Text('200x220',style: TextStyle(color: Color.fromRGBO( 0,25,255,1),fontSize: 10),),),
          ),
        ],
      ),
    );
  }
}
