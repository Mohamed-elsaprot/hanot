
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


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['title'] = title;
  //   map['type'] = type;
  //   return map;
  // }


  // HomeModelWithProducts copyWith({  num? id,
  //   String? title,
  //   String? type,
  // }) => HomeModelWithProducts(  id: id ?? this.id,
  //   title: title ?? this.title,
  //   type: type ?? this.type,
  // );

}