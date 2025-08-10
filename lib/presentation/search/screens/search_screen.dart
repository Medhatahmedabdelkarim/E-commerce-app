import 'package:demo_app/presentation/search/screens/search_dest_screen.dart';
import 'package:demo_app/presentation/search/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../product_details/screens/product_details.dart';
import '../manager/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.fromNavMenu});

  final bool fromNavMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppbar(fromNavMenu: fromNavMenu),
      body: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchLoaded && state.submitted) {
            Get.to(
              () => SearchDestScreen(
                products: state.products,
                query: state.query,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.title),
                  onTap: () {
                    Get.to(
                      () => ProductDetails(productId: state.products[index].id),
                    );
                  },
                );
              },
            );
          } else if (state is SearchRecent) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Searches'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.recent.length,
                      itemBuilder: (context, index) {
                        final query = state.recent[index];
                        return ListTile(
                          title: Text(query),
                          trailing: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              context.read<SearchBloc>().add(
                                RemoveRecentSearch(query),
                              );
                            },
                          ),
                          onTap: () {
                            context.read<SearchBloc>().add(
                              SearchSubmitted(query),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text("Search for products"));
          }
        },
      ),
    );
  }
}
