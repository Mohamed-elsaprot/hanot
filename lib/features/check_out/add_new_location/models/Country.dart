class Country {
  Country({
      this.id, 
      this.label,});

  Country.fromJson(dynamic json) {
    id = json['id'];
    label = json['label'];
  }
  num? id;
  String? label;
Country copyWith({  num? id,
  String? label,
}) => Country(  id: id ?? this.id,
  label: label ?? this.label,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['label'] = label;
    return map;
  }

}