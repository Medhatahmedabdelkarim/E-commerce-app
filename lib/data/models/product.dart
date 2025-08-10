import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/product_entity.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends ProductEntity {
  @HiveField(0)
  final List<String> images;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String description;

  @HiveField(4)
  int count;

  @HiveField(5)
  final int id;

  @HiveField(6)
  final bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    this.count = 1,
    this.isFavorite = false,
  }) : super(
    id: id,
    title: title,
    price: price,
    images: images,
    description: description,
    count: count,
    isFavorite: isFavorite,
  );

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
      id: parsedJson['id'] ?? 0,
      title: parsedJson['title'] ?? "",
      price: (parsedJson['price'] is int)
          ? (parsedJson['price'] as int).toDouble()
          : (parsedJson['price'] as num?)?.toDouble() ?? 0.0,
      images: (parsedJson['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      description: parsedJson['description'] ?? "",
      count: parsedJson['count'] ?? 1,
      isFavorite: parsedJson['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "images": images,
      "description": description,
      "count": count,
      "isFavorite": isFavorite,
    };
  }
  factory Product.fromEntity(ProductEntity entity) {
    return Product(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      images: entity.images,
      description: entity.description,
      count: entity.count,
      isFavorite: entity.isFavorite,
    );
  }

  // From Model → Entity
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      images: images,
      description: description,
      count: count,
      isFavorite: isFavorite,
    );
  }
}
