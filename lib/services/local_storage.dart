import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
import 'package:demo_app/data/models/product.dart';

class LocalStorageServices {
  static const key = 'cart_items';

  Future<void> saveCart(List<Product> cart) async {
    final cartBox=await Hive.openBox('cart');
    final List<Map<String, dynamic>>cartData = cart.map((product) => product.toJson()).toList();
    final String encodedCart = jsonEncode(cartData);
    await cartBox.put(key, encodedCart);
  }
  Future<List<Product>> loadCart() async {
    final cartBox=await Hive.openBox('cart');
    final cartData = cartBox.get(key);
    final List<dynamic> decoded = jsonDecode(cartData);
    return decoded.map((item) => Product.fromJson(item)).toList();
  }
}

