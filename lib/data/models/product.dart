import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
part 'product.g.dart';
@HiveType(typeId: 0)
class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    this.count = 1,
  });
  @HiveField(0)
  List<String> images;
  @HiveField(1)
  String title;
  @HiveField(2)
  double price;
  @HiveField(3)
  String description;
  @HiveField(4)
  int count;
  @HiveField(5)
  int id;

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
      id: parsedJson['id'] ?? 0,
      title: parsedJson['title'] ?? "",
      price: (parsedJson['price'] is int)
          ? (parsedJson['price'] as int).toDouble()
          : (parsedJson['price'] as num?)?.toDouble() ?? 0.0,
      images:  (parsedJson['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ?? [],
      description: parsedJson['description'] ?? "",
      count: parsedJson['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "title": title,
      "price": price,
      "images": images,
      "description": description,
      "count": count,
    };
  }
}