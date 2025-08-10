import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/services/local_storage.dart';

class CartLocalDataSource {
  final LocalStorageServices localStorage;

  CartLocalDataSource(this.localStorage);

  Future<void> saveCart(List<Product> items) async {
    await localStorage.saveLocal(items, localStorage.itemsKey, localStorage.key);
  }

  Future<List<Product>> loadCart() async {
    return await localStorage.loadLocal(localStorage.itemsKey, localStorage.key);
  }
}