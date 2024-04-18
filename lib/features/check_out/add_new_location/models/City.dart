class City {
  City({
      this.id, 
      this.label,});

  City.fromJson(dynamic json) {
    id = json['id'];
    label = json['label'];
  }
  num? id;
  String? label;
City copyWith({  num? id,
  String? label,
}) => City(  id: id ?? this.id,
  label: label ?? this.label,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['label'] = label;
    return map;
  }

}