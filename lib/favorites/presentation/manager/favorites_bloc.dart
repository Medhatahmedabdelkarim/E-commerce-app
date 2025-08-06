import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constants.dart';
import '../../../data/models/product.dart';
import '../../../services/local_storage.dart';
import '../../../services/service_locator.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final localStorage = sl.get<LocalStorageServices>();

  FavoritesBloc() : super(FavoritesState([])) {
    on<AddToFavorites>(_onAddToFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
    on<LoadFavorites>(_onLoadFavorites);
  }

  _onAddToFavorites(event, emit) async {
    final updatedFavorites = List<Product>.from(state.items);
    updatedFavorites.add(event.product);
    emit(FavoritesState(updatedFavorites));
    await localStorage.saveLocal(
      updatedFavorites,
      Constants.favoriteItemsKey,
      Constants.favoritesKey,
    );
  }

  _onRemoveFromFavorites(event, emit) async {
    final updatedFavorites = List<Product>.from(state.items);
    final index = updatedFavorites.indexWhere(
      (p) => p.title == event.product.title,
    );
    updatedFavorites.removeAt(index);
    emit(FavoritesState(updatedFavorites));
    await localStorage.saveLocal(
      updatedFavorites,
      Constants.favoriteItemsKey,
      Constants.favoritesKey,
    );
  }

  Future<void> _onLoadFavorites(event, emit) async {
    final savedFavorites = await localStorage.loadLocal(
      Constants.favoriteItemsKey,
      Constants.favoritesKey,
    );
    emit(FavoritesState(savedFavorites));
  }
}
