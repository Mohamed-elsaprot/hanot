class Values {
  Values({
      this.id, 
      this.name, 
      this.value, 
      this.image,});

  Values.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? value;
  String? image;
Values copyWith({  num? id,
  String? name,
  dynamic value,
  String? image,
}) => Values(  id: id ?? this.id,
  name: name ?? this.name,
  value: value ?? this.value,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['value'] = value;
    map['image'] = image;
    return map;
  }

}