class FilterItem {
  FilterItem({
      this.id, 
      this.name,});

  FilterItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
FilterItem copyWith({  num? id,
  String? name,
}) => FilterItem(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}