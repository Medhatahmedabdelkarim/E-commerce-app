import 'package:bloc/bloc.dart';
import 'package:demo_app/constants/constants.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/services/local_storage.dart';
import 'package:meta/meta.dart';

import '../../services/service_locator.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int counter = 0;
  final LocalStorage = sl.get<LocalStorageServices>();

  CartBloc() : super(CartState([])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    on<DeleteSpecificProduct>(_onDeleteSpecificProduct);
    _initializeCart();
  }

  _onAddToCart(event, emit) async {
    final updatedCart = List<Product>.from(state.items);
    final index = updatedCart.indexWhere((p) => p.title == event.product.title);
    if (index != -1) {
      updatedCart[index].count += 1;
    } else {
      updatedCart.add(event.product..count = 1);
    }
    emit(CartState(updatedCart));
    await LocalStorage.saveCart(
      updatedCart,
      Constants.cartItemsKey,
      Constants.cartKey,
    );
  }

  _onRemoveFromCart(event, emit) async {
    final updatedCart = List<Product>.from(state.items);
    final index = updatedCart.indexWhere((p) => p.title == event.product.title);
    if (index != -1) {
      if (updatedCart[index].count > 1) {
        updatedCart[index].count -= 1;
      } else {
        updatedCart.removeAt(index);
      }
    }
    emit(CartState(updatedCart));
    await LocalStorage.saveCart(
      updatedCart,
      Constants.cartItemsKey,
      Constants.cartKey,
    );
  }

  _onClearCart(event, emit) async {
    final updatedCart = List<Product>.from(state.items);
    updatedCart.clear();
    emit(CartState(updatedCart));
    await LocalStorage.saveCart(
      updatedCart,
      Constants.cartItemsKey,
      Constants.cartKey,
    );
  }

  _onDeleteSpecificProduct(event, emit) async {
    final updatedCart = List<Product>.from(state.items);
    final index = updatedCart.indexWhere((p) => p.title == event.product.title);
    updatedCart.removeAt(index);
    emit(CartState(updatedCart));
    await LocalStorage.saveCart(
      updatedCart,
      Constants.cartItemsKey,
      Constants.cartKey,
    );
  }

  double totalPrice() {
    return state.items.fold<double>(0, (a, b) => a + b.price * b.count);
  }

  void _initializeCart() async {
    final savedCart = await LocalStorage.loadCart(
      Constants.cartItemsKey,
      Constants.cartKey,
    );
    emit(CartState(savedCart));
  }
}
