

import 'package:hanot/core/models/category_model/Product.dart';

import 'Options.dart';
import 'Skus.dart';

class SingleProductModel {
  SingleProductModel({
      this.id, 
      this.name, 
      this.des,
      this.salePrice,
      this.costPrice, 
      this.discountPrice, 
      this.hasCampaign, 
      this.hasOptions, 
      this.hasDiscountPrice, 
      this.quantity, 
      this.weight, 
      this.width, 
      this.height, 
      this.length, 
      this.barcode, 
      this.image, 
      this.options, 
      required this.relatedProducts,
      this.skus,});

  SingleProductModel.fromJson(dynamic json) {

    id = json['id'];
    name = json['name'];
    des = json['description'];
    salePrice = json['sale_price'];
    costPrice = json['cost_price'];
    discountPrice = json['discount_price'];
    hasCampaign = json['has_campaign'];
    hasOptions = json['has_options'];
    hasDiscountPrice = json['has_discount_price'];
    // print(json['quantity']);
    quantity = num.tryParse(json['quantity'].toString())??0;
    // quantity = json['quantity'];
    // weight = json['weight'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    barcode = json['barcode'];
    image = json['image'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options.fromJson(v));
      });
    }
    if (json['skus'] != null) {
      skus = [];
      json['skus'].forEach((v) {
        skus?.add(Skus.fromJson(v));
      });
    }
    // if (json['related_products'] != null) {
    //   relatedProducts = [];
    //   json['related_products'].forEach((v) {
    //     relatedProducts?.add(Product.fromJson(v));
    //   });
    // }
  }
  num? id;
  String? name,des;
  num? salePrice;
  num? costPrice;
  num? discountPrice;
  bool? hasCampaign;
  bool? hasOptions;
  bool? hasDiscountPrice;
  num? quantity;
  String? weight;
  num? width;
  num? height;
  num? length;
  dynamic barcode;
  String? image;
  List<Options>? options;
  List<Skus>? skus;
  List<Product> relatedProducts=[];
SingleProductModel copyWith({  num? id,
  String? name,
  String? des,
  num? salePrice,
  num? costPrice,
  num? discountPrice,
  bool? hasCampaign,
  bool? hasOptions,
  bool? hasDiscountPrice,
  num? quantity,
  String? weight,
  num? width,
  num? height,
  num? length,
  dynamic barcode,
  String? image,
  List<Options>? options,
  List<Skus>? skus,
  List<Product>? relatedProducts,
}) => SingleProductModel(  id: id ?? this.id,
  name: name ?? this.name,
  des: des ?? this.des,
  salePrice: salePrice ?? this.salePrice,
  costPrice: costPrice ?? this.costPrice,
  discountPrice: discountPrice ?? this.discountPrice,
  hasCampaign: hasCampaign ?? this.hasCampaign,
  hasOptions: hasOptions ?? this.hasOptions,
  hasDiscountPrice: hasDiscountPrice ?? this.hasDiscountPrice,
  quantity: quantity ?? this.quantity,
  weight: weight ?? this.weight,
  width: width ?? this.width,
  height: height ?? this.height,
  length: length ?? this.length,
  barcode: barcode ?? this.barcode,
  image: image ?? this.image,
  options: options ?? this.options,
  skus: skus ?? this.skus,
  relatedProducts: relatedProducts ?? this.relatedProducts,
);

}