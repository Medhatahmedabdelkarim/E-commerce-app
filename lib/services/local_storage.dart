import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo_app/data/models/product.dart';

class LocalStorageServices {
  static const String _cartKey = 'cart_items';

  // Save cart items
   Future<void> saveCart(List<Product> cart) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cartMapList = cart.map((p) => p.toJson()).toList();
    final String encodedCart = jsonEncode(cartMapList);
    await prefs.setString('cart', encodedCart);
  }

  // Load cart items
   Future<List<Product>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartString = prefs.getString('cart');
    if (cartString == null) return [];

    final List<dynamic> decoded = jsonDecode(cartString);
    return decoded.map((item) => Product.fromJson(item)).toList();
  }
}