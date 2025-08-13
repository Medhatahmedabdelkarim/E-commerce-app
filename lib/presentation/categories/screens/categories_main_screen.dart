import 'package:demo_app/common_ui/Widgets/home_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/category.dart';
import '../../../services/api_services.dart';
import '../../../dependency_injection/service_locator.dart';
import '../manager/category_product_bloc/categories_bloc.dart';
import '../manager/main_categories_bloc/categories_list_bloc.dart';
import '../widgets/categories_grid_view.dart';

class CategoriesMainScreen extends StatelessWidget {
  const CategoriesMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CategoriesListBloc>()..add(LoadCategories()),
      child: Scaffold(
        appBar: HomeAppBar(),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
                  builder: (context, state) {
                    if (state is CategoriesListLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoriesListLoaded) {
                      if (state.categories.isEmpty) {
                        return const Center(child: Text('No categories found'));
                      }
                      return CategoriesGridView(categories: state.categories);
                    } else if (state is CategoriesListError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
