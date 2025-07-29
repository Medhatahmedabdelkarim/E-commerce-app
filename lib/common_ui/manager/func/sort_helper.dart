import 'package:demo_app/data/models/product.dart';

class SortHelper{

  static List<Product>sortProducts(String sortFun,List<Product>products){
    List<Product>sortedList=products;
    if(sortFun=='Sort from A-Z'){
      sortedList.sort((a, b) => a.title.compareTo(b.title));
    }
    else if(sortFun=='Sort from Z-A'){
     sortedList.sort((a, b) => b.title.compareTo(a.title));

    }
    else if(sortFun=='Sort by price descending'){
      sortedList.sort((a, b) => b.price.compareTo(a.price));

    }
    else if(sortFun=='Sort by price ascending'){
      sortedList.sort((a, b) => a.price.compareTo(b.price));
    }
    return sortedList;

  }
}