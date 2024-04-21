class ShippingCompany {
  ShippingCompany({
      this.id, 
      this.name, 
      this.priceId, 
      this.duration, 
      this.supportedCities, 
      this.cost,});

  ShippingCompany.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    priceId = json['price_id'];
    duration = json['duration'];
    supportedCities = json['supported_cities'] != null ? json['supported_cities'].cast<num>() : [];
    cost = json['cost'];
  }
  num? id;
  String? name;
  num? priceId;
  String? duration;
  List<num>? supportedCities;
  String? cost;
ShippingCompany copyWith({  num? id,
  String? name,
  num? priceId,
  String? duration,
  List<num>? supportedCities,
  String? cost,
}) => ShippingCompany(  id: id ?? this.id,
  name: name ?? this.name,
  priceId: priceId ?? this.priceId,
  duration: duration ?? this.duration,
  supportedCities: supportedCities ?? this.supportedCities,
  cost: cost ?? this.cost,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price_id'] = priceId;
    map['duration'] = duration;
    map['supported_cities'] = supportedCities;
    map['cost'] = cost;
    return map;
  }

}