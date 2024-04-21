class PaymentMethodModel {
  PaymentMethodModel({
      this.id, 
      this.name, 
      this.description, 
      this.slug, 
      this.logo,});

  PaymentMethodModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    logo = json['logo'];
  }
  num? id;
  String? name;
  String? description;
  String? slug;
  String? logo;
PaymentMethodModel copyWith({  num? id,
  String? name,
  String? description,
  String? slug,
  String? logo,
}) => PaymentMethodModel(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  slug: slug ?? this.slug,
  logo: logo ?? this.logo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['slug'] = slug;
    map['logo'] = logo;
    return map;
  }

}