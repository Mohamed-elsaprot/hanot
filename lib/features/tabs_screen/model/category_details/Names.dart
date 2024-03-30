class Names {
  Names({
      this.he,});

  Names.fromJson(dynamic json) {
    he = json['he'];
  }
  String? he;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['he'] = he;
    return map;
  }

}