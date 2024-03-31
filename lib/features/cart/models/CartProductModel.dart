import 'Options.dart';

class CartProductModel {
  CartProductModel({
      this.rowId, 
      this.name, 
      this.productId, 
      this.skuId, 
      this.qty, 
      // this.options,
      this.salePrice, 
      this.netTotal, 
      this.discountTotal, 
      this.total,});

  CartProductModel.fromJson(dynamic json) {
    rowId = json['rowId'];
    name = json['name'];
    productId = json['product_id'];
    skuId = json['sku_id'];
    qty = json['qty'];
    // options = json['options'] != null ? Options.fromJson(json['options']) : null;
    salePrice = json['sale_price'];
    netTotal = json['net_total'];
    discountTotal = json['discount_total'];
    total = json['total'];
  }
  String? rowId;
  String? name;
  num? productId;
  num? skuId;
  num? qty;
  // Options? options;
  num? salePrice;
  num? netTotal;
  num? discountTotal;
  num? total;
CartProductModel copyWith({  String? rowId,
  String? name,
  num? productId,
  num? skuId,
  num? qty,
  // Options? options,
  num? salePrice,
  num? netTotal,
  num? discountTotal,
  num? total,
}) => CartProductModel(  rowId: rowId ?? this.rowId,
  name: name ?? this.name,
  productId: productId ?? this.productId,
  skuId: skuId ?? this.skuId,
  qty: qty ?? this.qty,
  // options: options ?? this.options,
  salePrice: salePrice ?? this.salePrice,
  netTotal: netTotal ?? this.netTotal,
  discountTotal: discountTotal ?? this.discountTotal,
  total: total ?? this.total,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rowId'] = rowId;
    map['name'] = name;
    map['product_id'] = productId;
    map['sku_id'] = skuId;
    map['qty'] = qty;
    // if (options != null) {
    //   map['options'] = options?.toJson();
    // }
    map['sale_price'] = salePrice;
    map['net_total'] = netTotal;
    map['discount_total'] = discountTotal;
    map['total'] = total;
    return map;
  }

}