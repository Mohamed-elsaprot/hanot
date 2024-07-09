class Links {
  Links({this.next ,this.last,this.first,this.prev});

  Links.fromJson(dynamic json) {
    first = json['first'];
    last = json['last'];
    next = json['next'];
    prev = json['prev'];
  }
  String? first;
  String? last;
  String? prev;
  String? next;

//   Links copyWith({  String? url,
//   String? label,
//   bool? active,
// }) => Links(  url: url ?? url,
//   label: label ?? label,
//   active: active ?? active,
// );
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['url'] = _url;
  //   map['label'] = _label;
  //   map['active'] = _active;
  //   return map;
  // }

}