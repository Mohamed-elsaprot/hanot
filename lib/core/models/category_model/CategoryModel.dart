import 'Product.dart';
import 'Links.dart';
import 'Meta.dart';

class CategoryProductsModel {
  CategoryProductsModel({
    required this.productsList,
    required this.links,
    required this.message,
    required this.meta,
    });

  CategoryProductsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      productsList = [];
      json['data'].forEach((v) {
        productsList?.add(Product.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
  }
  List<Product>? productsList;
  Links? links;
  Meta? meta;
  String? message;

  CategoryProductsModel copyWith({ required List<Product>? list, required Links? links, required Meta? meta, required String? message,
  }) => CategoryProductsModel(
    productsList: list ,
    links: links,
    meta: meta,
    message: message,
  );

}


