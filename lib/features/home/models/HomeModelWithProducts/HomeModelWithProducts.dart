
import '../../../../core/models/category_model/Product.dart';

class HomeModelWithProducts {
  HomeModelWithProducts({
      this.id, 
      this.title, 
      this.type,
      this.productsList,
  });

  HomeModelWithProducts.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    if (json['data'] != null) {
      productsList = [];
      json['data'].forEach((v) {
        productsList?.add(Product.fromJson(v));
      });
    }
  }
  num? id;
  String? title;
  String? type;
  List<Product>? productsList;

}