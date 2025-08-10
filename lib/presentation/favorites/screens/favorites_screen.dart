import 'package:demo_app/common_ui/Widgets/inc_dec.dart';
import 'package:demo_app/presentation/favorites/manager/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesItemsBloc = context.read<FavoritesBloc>();
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Your Bag',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              centerTitle: true,
            ),
            body: Center(child: Text('Favorites is empty')),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Your Favorites',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              centerTitle: true,
            ),
            body: FavoritesItemCard(state, FavoritesItemsBloc),
          );
        }
      },
    );
  }

  Padding FavoritesItemCard(
    FavoritesState state,
    FavoritesBloc FavoritesItemsBloc,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 24, bottom: 12, right: 24, left: 24),
      child: ListView.separated(
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Divider(
            color: Color.fromRGBO(212, 214, 221, 1),
            thickness: 0.5,
          ),
        ),
        shrinkWrap: true,
        itemCount: state.items.length,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 90,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(248, 249, 254, 1),
                  ),
                  child: Image.network(
                    state.items[index].images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    right: 16,
                    left: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: 237,
                          child: Text(
                            '${state.items[index].title}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Blue / 160x200',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!state.items.contains(state.items[index])) {
                                FavoritesItemsBloc.add(
                                  AddToFavorites(state.items[index]),
                                );
                              } else {
                                FavoritesItemsBloc.add(
                                  RemoveFromFavorites(state.items[index]),
                                );
                              }
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              child: !state.items.contains(state.items[index])
                                  ? Image.asset(
                                      'assets/Images/Heart Outlined.png',
                                      color: EColors.primary,
                                    )
                                  : Image.asset(
                                      'assets/Images/Heart Filled.png',
                                      color: EColors.primary,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${state.items[index].price}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 108),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
