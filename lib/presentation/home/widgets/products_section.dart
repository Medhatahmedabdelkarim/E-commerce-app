import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_ui/Widgets/products_grid.dart';
import '../manager/home_bloc.dart';

class ProductsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        }
        else if (state is HomeLoaded) {
          return ProductsGridView(products: state.products);
        }
        return SizedBox();
      },
    );
  }
}