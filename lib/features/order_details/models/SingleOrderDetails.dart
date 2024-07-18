class SingleOrderItem {
  SingleOrderItem({
      this.id, 
      this.name, 
      this.image, 
      this.categories, 
      this.quantity, 
      this.salePrice,});

  SingleOrderItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    quantity = json['quantity'];
    salePrice = json['sale_price'];
  }
  num? id;
  String? name;
  String? image;
  List<String>? categories;
  num? quantity;
  num? salePrice;
SingleOrderItem copyWith({  num? id,
  String? name,
  String? image,
  List<String>? categories,
  num? quantity,
  num? salePrice,
}) => SingleOrderItem(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
  categories: categories ?? this.categories,
  quantity: quantity ?? this.quantity,
  salePrice: salePrice ?? this.salePrice,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['categories'] = categories;
    map['quantity'] = quantity;
    map['sale_price'] = salePrice;
    return map;
  }

}