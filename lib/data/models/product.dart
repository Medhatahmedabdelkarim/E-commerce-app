class Product{
  Product({required this.title , required this.price,required this.imageUrl,required this.description,this.count=0});

  final String imageUrl;
  String title;
  String price;
  String description;
  int count ;


}