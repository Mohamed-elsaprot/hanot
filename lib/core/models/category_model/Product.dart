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
      this.images,
      this.inFavorites,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    costPrice = json['cost_price'];
    discountPrice = json['discount_price'];
    hasCampaign = json['has_campaign'];
    hasOptions = json['has_options'];
    inFavorites = json['in_favorites'];
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
  bool? inFavorites;
  num? quantity;
  String? weight;
  num? width;
  num? height;
  num? length;
  num count=1;
  dynamic barcode;
  String? image;
  List<String>? images;

}