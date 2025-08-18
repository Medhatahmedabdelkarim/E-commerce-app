import '../entities/product_entity.dart';
import '../repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<List<ProductEntity>> call(List<ProductEntity> currentItems, ProductEntity product) async {
    final updatedCart = List<ProductEntity>.from(currentItems);
    final index = updatedCart.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      updatedCart[index].count += 1;
    } else {
      product.count = 1;
      updatedCart.add(product);
    }
    await repository.saveCart(updatedCart);
    return updatedCart;
  }
}

class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<List<ProductEntity>> call(List<ProductEntity> currentItems, ProductEntity product) async {
    final updatedCart = List<ProductEntity>.from(currentItems);
    final index = updatedCart.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      if (updatedCart[index].count > 1) {
        updatedCart[index].count -= 1;
      } else {
        updatedCart.removeAt(index);
      }
    }
    await repository.saveCart(updatedCart);
    return updatedCart;
  }
}

class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    final emptyCart = <ProductEntity>[];
    await repository.saveCart(emptyCart);
    return emptyCart;
  }
}

class DeleteSpecificProductUseCase {
  final CartRepository repository;

  DeleteSpecificProductUseCase(this.repository);

  Future<List<ProductEntity>> call(List<ProductEntity> currentItems, ProductEntity product) async {
    final updatedCart = List<ProductEntity>.from(currentItems);
    final index = updatedCart.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      updatedCart.removeAt(index);
    }
    await repository.saveCart(updatedCart);
    return updatedCart;
  }
}

class GetTotalPriceUseCase {
  double call(List<ProductEntity> items) {
    return items.fold<double>(0, (sum, item) => sum + item.price * item.count);
  }
}

class LoadCartUseCase {
  final CartRepository repository;

  LoadCartUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.loadCart();
  }
}