class Customer {
  Customer({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.image,});

  Customer.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }
  num? id;
  dynamic name;
  String? email;
  dynamic phone;
  String? image;
Customer copyWith({  num? id,
  dynamic name,
  String? email,
  dynamic phone,
  String? image,
}) => Customer(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    return map;
  }

}