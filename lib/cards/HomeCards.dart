import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  const CardDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(child:Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset("assets/Images/mimic.png"),
          Container(
              color: Colors.grey.withValues(alpha: 0.2),
              width: double.infinity,
              child: Padding(padding: EdgeInsets.all(8),child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sleek boxing gloves',style:TextStyle(fontWeight:FontWeight.bold),),
                  SizedBox(height: 4,),
                  Text('This modern boxing glove combines style and efficiency with its unique design and top notch...')

                ],
              )
          )
          )
        ],
      ),
    ));
  }
}