import 'package:demo_app/constants/colors.dart';
import 'package:demo_app/filter/presentation/widgets/filters_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget{
  FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FiltersAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
            child: ExpansionTile(title: Text('Category',style: TextStyle(fontSize: 14),)),
          ),
          Divider(indent: 20,endIndent: 20,color: Color.fromRGBO(212,214,221, 1)),
          Padding(
            padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
            child: ExpansionTile(title: Text('Price Range',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
          ),
          Divider(indent: 20,endIndent: 20,color: Color.fromRGBO(212,214,221, 1)),
          Padding(
            padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
            child: ExpansionTile(title: Text('Color',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
          ),
          Divider(indent: 20,endIndent: 20,color: Color.fromRGBO(212,214,221, 1,)),
          Padding(
            padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
            child: ExpansionTile(title: Text('Size',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
          ),
          Divider(indent: 20,endIndent: 20,color: Color.fromRGBO(212,214,221, 1)),
          Padding(
            padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
            child: ExpansionTile(title: Text('Customer Review',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
          ),
          Divider(indent: 20,endIndent: 20,color: Color.fromRGBO(212,214,221, 1)),
        ],
      ),
    );
  }
}