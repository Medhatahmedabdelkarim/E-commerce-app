import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
part 'product.g.dart';
@HiveType(typeId: 0)
class Product {
  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.count = 1,
  });
  @HiveField(0)
  final String imageUrl;
  @HiveField(1)
  String title;
  @HiveField(2)
  double price;
  @HiveField(3)
  String description;
  @HiveField(4)
  int count;

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
      title: parsedJson['title'] ?? "",
      price: (parsedJson['price'] is int)
          ? (parsedJson['price'] as int).toDouble()
          : (parsedJson['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: parsedJson['imageUrl'] ?? "",
      description: parsedJson['description'] ?? "",
      count: parsedJson['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "price": price,
      "imageUrl": imageUrl,
      "description": description,
      "count": count,
    };
  }
}