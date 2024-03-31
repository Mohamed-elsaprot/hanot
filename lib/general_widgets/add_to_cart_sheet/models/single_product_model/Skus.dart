class Skus {
  Skus({
      this.id, 
      this.title, 
      this.salePrice, 
      this.costPrice, 
      this.discountPrice, 
      this.hasDiscountPrice, 
      this.quantity, 
      this.valuesIds,});

  Skus.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    salePrice = json['sale_price'];
    costPrice = json['cost_price'];
    discountPrice = json['discount_price'];
    hasDiscountPrice = json['has_discount_price'];
    quantity = json['quantity'];
    valuesIds = json['values_ids'] != null ? json['values_ids'].cast<num>() : [];
  }
  num? id;
  String? title;
  num? salePrice;
  num? costPrice;
  num? discountPrice;
  bool? hasDiscountPrice;
  num? quantity;
  List<num>? valuesIds;
Skus copyWith({  num? id,
  String? title,
  num? salePrice,
  num? costPrice,
  num? discountPrice,
  bool? hasDiscountPrice,
  num? quantity,
  List<num>? valuesIds,
}) => Skus(  id: id ?? this.id,
  title: title ?? this.title,
  salePrice: salePrice ?? this.salePrice,
  costPrice: costPrice ?? this.costPrice,
  discountPrice: discountPrice ?? this.discountPrice,
  hasDiscountPrice: hasDiscountPrice ?? this.hasDiscountPrice,
  quantity: quantity ?? this.quantity,
  valuesIds: valuesIds ?? this.valuesIds,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['sale_price'] = salePrice;
    map['cost_price'] = costPrice;
    map['discount_price'] = discountPrice;
    map['has_discount_price'] = hasDiscountPrice;
    map['quantity'] = quantity;
    map['values_ids'] = valuesIds;
    return map;
  }

}