import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/domain/entities/product_entity.dart';

class SortHelper{

  static List<ProductEntity>sortProducts(String sortFun,List<ProductEntity>products){
    List<ProductEntity>sortedList=products;
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