class Address {
  Address({
      this.id, 
      this.city, 
      this.country, 
      this.postalCode, 
      this.streetName, 
      this.homeAddress, 
      this.neighborhood,});

  Address.fromJson(dynamic json) {
    id = json['id'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postal_code'];
    streetName = json['street_name'];
    homeAddress = json['home_address'];
    neighborhood = json['neighborhood'];
  }
  num? id;
  String? city;
  String? country;
  String? postalCode;
  String? streetName;
  String? homeAddress;
  String? neighborhood;
Address copyWith({  num? id,
  String? city,
  String? country,
  String? postalCode,
  String? streetName,
  String? homeAddress,
  String? neighborhood,
}) => Address(  id: id ?? this.id,
  city: city ?? this.city,
  country: country ?? this.country,
  postalCode: postalCode ?? this.postalCode,
  streetName: streetName ?? this.streetName,
  homeAddress: homeAddress ?? this.homeAddress,
  neighborhood: neighborhood ?? this.neighborhood,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city'] = city;
    map['country'] = country;
    map['postal_code'] = postalCode;
    map['street_name'] = streetName;
    map['home_address'] = homeAddress;
    map['neighborhood'] = neighborhood;
    return map;
  }

}