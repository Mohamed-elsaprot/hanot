class ShippingFeesModel {
  ShippingFeesModel({
      this.shippingFees, 
      this.total,});

  ShippingFeesModel.fromJson(dynamic json) {
    shippingFees = double.tryParse(json['shipping_fees']);
    total = double.tryParse(json['total']);
  }
  num? shippingFees;
  num? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shipping_fees'] = shippingFees;
    map['total'] = total;
    return map;
  }

}