

import 'Options.dart';
import 'Skus.dart';

class SingleProductModel {
  SingleProductModel({
      this.id, 
      this.name, 
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
      this.skus,});

  SingleProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    costPrice = json['cost_price'];
    discountPrice = json['discount_price'];
    hasCampaign = json['has_campaign'];
    hasOptions = json['has_options'];
    hasDiscountPrice = json['has_discount_price'];
    quantity = json['quantity'];
    weight = json['weight'];
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
  }
  num? id;
  String? name;
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
SingleProductModel copyWith({  num? id,
  String? name,
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
}) => SingleProductModel(  id: id ?? this.id,
  name: name ?? this.name,
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
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['sale_price'] = salePrice;
    map['cost_price'] = costPrice;
    map['discount_price'] = discountPrice;
    map['has_campaign'] = hasCampaign;
    map['has_options'] = hasOptions;
    map['has_discount_price'] = hasDiscountPrice;
    map['quantity'] = quantity;
    map['weight'] = weight;
    map['width'] = width;
    map['height'] = height;
    map['length'] = length;
    map['barcode'] = barcode;
    map['image'] = image;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    if (skus != null) {
      map['skus'] = skus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}