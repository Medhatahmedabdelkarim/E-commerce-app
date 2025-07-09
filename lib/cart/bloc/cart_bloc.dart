import 'package:bloc/bloc.dart';
import 'package:demo_app/data/models/product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int counter=0;
  CartBloc() : super(CartState([])) {
    on<CartEvent>(addedToCart);

  }
   addedToCart(CartEvent event,Emitter<CartState>emit)  {
       if(event is AddToCart){
         final updatedCart=List<Product>.from(state.items)..add(event.product);
         emit(CartState(updatedCart));
       }
       else if(event is RemoveFromCart){
         final updatedCart=List<Product>.from(state.items)..remove(event.product);
         emit(CartState(updatedCart));
       }
  }
}


