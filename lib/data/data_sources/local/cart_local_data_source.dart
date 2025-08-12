import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/services/local_storage.dart';

import '../../../constants/constants.dart';

class CartLocalDataSource {
  final LocalStorageServices localStorage;

  CartLocalDataSource(this.localStorage);

  Future<void> saveCart(List<Product> items) async {
    await localStorage.saveLocal(items, Constants.cartItemsKey, Constants.cartKey);
  }

  Future<List<Product>> loadCart() async {
    return await localStorage.loadLocal(Constants.cartItemsKey, Constants.cartKey);
  }
}