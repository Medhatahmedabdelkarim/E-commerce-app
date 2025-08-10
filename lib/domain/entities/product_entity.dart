class ProductEntity {
  final int id;
  final String title;
  final double price;
  final List<String> images;
  final String description;
  int count;
  final bool isFavorite;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    this.count = 1,
    this.isFavorite = false,
  });}