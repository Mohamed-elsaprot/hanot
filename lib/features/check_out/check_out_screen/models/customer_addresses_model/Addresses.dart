class Address {
  Address({
      this.id, 
      this.countryId, 
      this.cityId, 
      this.country, 
      this.city, 
      this.neighborhood, 
      this.streetName, 
      this.homeAddress, 
      this.postalCode, 
      this.createdAt,});

  Address.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    country = json['country'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    streetName = json['street_name'];
    homeAddress = json['home_address'];
    postalCode = json['postal_code'];
    createdAt = json['created_at'];
  }
  num? id;
  num? countryId;
  num? cityId;
  String? country;
  String? city;
  String? neighborhood;
  dynamic streetName;
  dynamic homeAddress;
  String? postalCode;
  String? createdAt;
Address copyWith({  num? id,
  num? countryId,
  num? cityId,
  String? country,
  String? city,
  String? neighborhood,
  dynamic streetName,
  dynamic homeAddress,
  String? postalCode,
  String? createdAt,
}) => Address(  id: id ?? this.id,
  countryId: countryId ?? this.countryId,
  cityId: cityId ?? this.cityId,
  country: country ?? this.country,
  city: city ?? this.city,
  neighborhood: neighborhood ?? this.neighborhood,
  streetName: streetName ?? this.streetName,
  homeAddress: homeAddress ?? this.homeAddress,
  postalCode: postalCode ?? this.postalCode,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['city_id'] = cityId;
    map['country'] = country;
    map['city'] = city;
    map['neighborhood'] = neighborhood;
    map['street_name'] = streetName;
    map['home_address'] = homeAddress;
    map['postal_code'] = postalCode;
    map['created_at'] = createdAt;
    return map;
  }

}