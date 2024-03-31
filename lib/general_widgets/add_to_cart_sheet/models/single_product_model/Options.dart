import 'Values.dart';

class Options {
  Options({
      this.id, 
      this.name, 
      this.type, 
      this.values,});

  Options.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    if (json['values'] != null) {
      values = [];
      json['values'].forEach((v) {
        values?.add(Values.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  String? type;
  List<Values>? values;
Options copyWith({  num? id,
  String? name,
  String? type,
  List<Values>? values,
}) => Options(  id: id ?? this.id,
  name: name ?? this.name,
  type: type ?? this.type,
  values: values ?? this.values,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    if (values != null) {
      map['values'] = values?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}