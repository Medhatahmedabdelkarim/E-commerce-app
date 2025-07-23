class Category{
  Category({required this.id,required this.name,required this.image});


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
    return {
      "id": id,
      "name": name,
      "image": image,
    };
  }
}
