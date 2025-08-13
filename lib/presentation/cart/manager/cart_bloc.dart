import 'package:bloc/bloc.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:demo_app/domain/repositories/cart_repository.dart';
import 'package:demo_app/dependency_injection/service_locator.dart';
import 'package:meta/meta.dart';

import '../../../domain/UseCases/cart_use_cases.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final ClearCartUseCase clearCartUseCase;
  final DeleteSpecificProductUseCase deleteProductUseCase;
  final LoadCartUseCase loadCartUseCase;
  final GetTotalPriceUseCase getTotalPriceUseCase;

  CartBloc({
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
    required this.clearCartUseCase,
    required this.deleteProductUseCase,
    required this.loadCartUseCase,
    required this.getTotalPriceUseCase,
  }) : super(CartState([])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    on<DeleteSpecificProduct>(_onDeleteSpecificProduct);
    _initializeCart();
  }

  _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final updatedCart = await addToCartUseCase(state.items, event.product);
    emit(CartState(updatedCart));
  }

  _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    final updatedCart = await removeFromCartUseCase(state.items, event.product);
    emit(CartState(updatedCart));
  }

  _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    final updatedCart = await clearCartUseCase();
    emit(CartState(updatedCart));
  }

  _onDeleteSpecificProduct(DeleteSpecificProduct event, Emitter<CartState> emit) async {
    final updatedCart = await deleteProductUseCase(state.items, event.product);
    emit(CartState(updatedCart));
  }

  double totalPrice() {
    return getTotalPriceUseCase(state.items);
  }

  void _initializeCart() async {
    final savedCart = await loadCartUseCase();
    emit(CartState(savedCart));
  }
}
