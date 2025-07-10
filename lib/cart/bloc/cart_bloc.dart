import 'package:bloc/bloc.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/services/local_storage.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int counter = 0;

  CartBloc() : super(CartState([])) {
    on<CartEvent>(addedToCart);
    on<LoadCart>(_loadCart);
    _initializeCart();
  }


  // Your existing method with SharedPreferences added
  Future<void> addedToCart(CartEvent event, Emitter<CartState> emit) async {
    final updatedCart = List<Product>.from(state.items);

    if (event is AddToCart) {
      final index = updatedCart.indexWhere((p) => p.title == event.product.title);
      if (index != -1) {
        updatedCart[index].count += 1;
      } else {
        updatedCart.add(event.product..count = 1);
      }
    } else if (event is RemoveFromCart) {
      final index = updatedCart.indexWhere((p) => p.title == event.product.title);
      if (index != -1) {
        if (updatedCart[index].count > 1) {
          updatedCart[index].count -= 1;
        } else {
          updatedCart.removeAt(index);
        }
      }
    }

    emit(CartState(updatedCart));
    await LocalStorageServices.saveCart(updatedCart);
  }

  // Load cart from SharedPreferences
  _loadCart(LoadCart event, Emitter<CartState> emit) async {
    final cartItems = await LocalStorageServices.loadCart();
    emit(CartState(cartItems));
  }

  void _initializeCart() async {
    final savedCart = await LocalStorageServices.loadCart();
    emit(CartState(savedCart));
  }


}
