import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height:150,
        child:ListView.builder(
            itemCount:6 ,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,position) {
              return Padding(
                  padding:EdgeInsets.all(8),
                  child:Container(
                    height:50,
                    width:100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.blue
                    ),
                  ));
            })


    );
  }
}