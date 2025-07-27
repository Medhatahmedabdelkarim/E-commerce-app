import 'package:demo_app/Search/presentation/search_app_bar.dart';
import 'package:demo_app/categories/presentation/widgets/CategoryItemAppBar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget{

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:SearchAppbar() ,
    );
  }

}