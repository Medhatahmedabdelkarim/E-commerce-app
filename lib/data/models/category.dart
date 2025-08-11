import 'package:demo_app/domain/entities/category_entity.dart';

class Category extends CategoryEntity {
  Category({required this.id, required this.name, required this.image})
    : super(id: id, name: name, image: image);

  int id;
  String name;
  String image;

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
      id: parsedJson['id'] ?? 0,
      name: parsedJson['name'] ?? "",
      image: parsedJson['image'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "image": image};
  }

  factory Category.fromEntity(CategoryEntity entity) {
    return Category(id: entity.id, name: entity.name, image: entity.image);
  }

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, image: image);
  }
}
