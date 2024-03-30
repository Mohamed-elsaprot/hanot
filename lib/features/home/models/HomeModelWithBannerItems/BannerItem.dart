class BannerItem {
  BannerItem({
      this.id, 
      this.path, 
      this.link,});

  BannerItem.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
    link = json['link'];
  }
  num? id;
  String? path;
  String? link;


// BannerItem copyWith({  num? id,
//   String? path,
//   String? link,
// }) => BannerItem(  id: id ?? this.id,
//   path: path ?? this.path,
//   link: link ?? this.link,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['path'] = path;
//     map['link'] = link;
//     return map;
//   }

}