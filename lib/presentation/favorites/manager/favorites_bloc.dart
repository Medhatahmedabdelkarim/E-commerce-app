import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../constants/constants.dart';
import '../../../data/models/product.dart';
import '../../../domain/UseCases/favorites_use_cases.dart';
import '../../../services/local_storage.dart';
import '../../../dependency_injection/service_locator.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase removeFromFavoritesUseCase;
  final LoadFavoritesUseCase loadFavoritesUseCase;

  FavoritesBloc({
    required this.addToFavoritesUseCase,
    required this.removeFromFavoritesUseCase,
    required this.loadFavoritesUseCase,
  }) : super(FavoritesState([])) {
    on<AddToFavorites>(_onAddToFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
    on<LoadFavorites>(_onLoadFavorites);
  }

  Future<void> _onAddToFavorites(AddToFavorites event, Emitter<FavoritesState> emit) async {
    final updated = await addToFavoritesUseCase(state.items, event.product);
    emit(FavoritesState(updated));
  }

  Future<void> _onRemoveFromFavorites(RemoveFromFavorites event, Emitter<FavoritesState> emit) async {
    final updated = await removeFromFavoritesUseCase(state.items, event.product);
    emit(FavoritesState(updated));
  }

  Future<void> _onLoadFavorites(LoadFavorites event, Emitter<FavoritesState> emit) async {
    final loaded = await loadFavoritesUseCase();
    emit(FavoritesState(loaded));
  }
}
