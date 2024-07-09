class Product {
  Product({
      this.id,
      this.name,
      this.salePrice,
      this.costPrice,
      this.discountPrice,
      this.hasCampaign,
      this.hasOptions,
      this.quantity,
      this.weight,
      this.width,
      this.height,
      this.length,
      dynamic barcode, 
      this.image,
      this.images,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    costPrice = json['cost_price'];
    discountPrice = json['discount_price'];
    hasCampaign = json['has_campaign'];
    hasOptions = json['has_options'];
    quantity = json['quantity'];
    weight = json['weight'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    barcode = json['barcode'];
    image = json['image'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  num? id;
  String? name;
  num? salePrice;
  num? costPrice;
  num? discountPrice;
  bool? hasCampaign;
  bool? hasOptions;
  num? quantity;
  String? weight;
  num? width;
  num? height;
  num? length;
  num count=1;
  dynamic barcode;
  String? image;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['sale_price'] = salePrice;
    map['cost_price'] = costPrice;
    map['discount_price'] = discountPrice;
    map['has_campaign'] = hasCampaign;
    map['has_options'] = hasOptions;
    map['quantity'] = quantity;
    map['weight'] = weight;
    map['width'] = width;
    map['height'] = height;
    map['length'] = length;
    map['barcode'] = barcode;
    map['image'] = image;
    map['images'] = images;
    return map;
  }

}