class SingleSkuDetails {
  SingleSkuDetails({
    this.skuId,
    this.salePrice,
    this.quantity,
    this.discountPrice,
    this.hasDiscountPrice,
});

  SingleSkuDetails.fromJson(dynamic json) {
    skuId = json['sku_id'];
    quantity = json['quantity'];
    salePrice = json['sale_price'];
    discountPrice = json['discount_price'];
    hasDiscountPrice = json['has_discount_price'];
  }

  num? skuId;
  num? quantity;
  num? salePrice;
  num? discountPrice;
  bool? hasDiscountPrice;

}