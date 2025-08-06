import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
import 'package:demo_app/data/models/product.dart';

class LocalStorageServices {
  LocalStorageServices({required this.itemsKey, required this.key});

  String itemsKey;
  String key;

  Future<void> saveLocal(
    List<Product> cart,
    String itemsKey,
    String key,
  ) async {
    final cartBox = await Hive.openBox(key);
    final List<Map<String, dynamic>> cartData = cart
        .map((product) => product.toJson())
        .toList();
    final String encodedCart = jsonEncode(cartData);
    await cartBox.put(itemsKey, encodedCart);
  }

  Future<List<Product>> loadLocal(String itemsKey, String key) async {
    final cartBox = await Hive.openBox(key);
    final cartData = cartBox.get(itemsKey);
    final List<dynamic> decoded = jsonDecode(cartData);
    return decoded.map((item) => Product.fromJson(item)).toList();
  }
}
