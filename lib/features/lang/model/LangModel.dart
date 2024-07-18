class LangModel {
  LangModel({
      this.id, 
      this.name, 
      this.native, 
      this.direction, 
      this.locale,
      this.isDefault,});

  LangModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    native = json['native'];
    direction = json['direction'];
    locale = json['locale'];
    isDefault = json['is_default'];
  }
  num? id;
  String? name;
  String? native;
  String? direction;
  String? locale;
  bool? isDefault;
LangModel copyWith({  num? id,
  String? name,
  String? native,
  String? direction,
  String? lang,
  bool? isDefault,
}) => LangModel(  id: id ?? this.id,
  name: name ?? this.name,
  native: native ?? this.native,
  direction: direction ?? this.direction,
  locale: lang ?? this.locale,
  isDefault: isDefault ?? this.isDefault,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['native'] = native;
    map['direction'] = direction;
    map['locale'] = locale;
    map['is_default'] = isDefault;
    return map;
  }

}