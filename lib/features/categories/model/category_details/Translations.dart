class Translations {
  Translations({
      this.id, 
      this.categoryId, 
      this.name, 
      this.locale,});

  Translations.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    locale = json['locale'];
  }
  int? id;
  int? categoryId;
  String? name;
  String? locale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['name'] = name;
    map['locale'] = locale;
    return map;
  }

}