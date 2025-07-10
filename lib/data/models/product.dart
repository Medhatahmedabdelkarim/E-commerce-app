import 'dart:convert';

class Product {
  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.count = 1,
  });

  final String imageUrl;
  String title;
  double price;
  String description;
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