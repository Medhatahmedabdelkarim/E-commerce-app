import 'package:demo_app/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common_ui/Widgets/home_app_bar.dart';
import '../../../common_ui/Widgets/products_grid.dart';
import '../../../common_ui/cards/home_main_card.dart';
import '../../../constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product.dart';
import '../../../dependency_injection/service_locator.dart';
import '../manager/home_bloc.dart';
import '../widgets/home_header.dart';
import '../widgets/products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardDesign(),
            Padding(
              padding: EdgeInsets.only(
                right: 16,
                bottom: 16,
                left: 16,
                top: 16,
              ),
              child: BlocProvider(
                create: (context) => sl<HomeBloc>()..add(LoadProductsEvent()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(title: "All Products",),
                    ProductsSection(),
                    HomeHeader(title: "Best Selling",),
                    ProductsSection(),




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

