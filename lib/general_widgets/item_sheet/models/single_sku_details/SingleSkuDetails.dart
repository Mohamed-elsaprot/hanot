class SingleSkuDetails {
  SingleSkuDetails({this.options, this.productId,});

  SingleSkuDetails.fromJson(dynamic json) {
    options = json['options'] != null ? json['options'].cast<num>() : [];
    productId = json['product_id'];
  }
  List<num>? options;
  num? productId;
SingleSkuDetails copyWith({  List<num>? options,
  num? productId,
}) => SingleSkuDetails(  options: options ?? this.options,
  productId: productId ?? this.productId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['options'] = options;
    map['product_id'] = productId;
    return map;
  }

}