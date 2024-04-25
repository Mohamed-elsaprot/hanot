class StatusColor {
  StatusColor({
      this.id, 
      this.title, 
      this.key, 
      this.icon, 
      this.color,});

  StatusColor.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    key = json['key'];
    icon = json['icon'];
    color = json['color'];
  }
  num? id;
  String? title;
  String? key;
  String? icon;
  String? color;
StatusColor copyWith({  num? id,
  String? title,
  String? key,
  String? icon,
  String? color,
}) => StatusColor(  id: id ?? this.id,
  title: title ?? this.title,
  key: key ?? this.key,
  icon: icon ?? this.icon,
  color: color ?? this.color,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['key'] = key;
    map['icon'] = icon;
    map['color'] = color;
    return map;
  }

}