import 'BannerItem.dart';

class HomeModelWithBannerItems {
  HomeModelWithBannerItems({
      this.id, 
      this.title, 
      this.type, 
      this.bannerItem,});

  HomeModelWithBannerItems.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    if (json['data'] != null) {
      bannerItem = [];
      json['data'].forEach((v) {
        bannerItem?.add(BannerItem.fromJson(v));
      });
    }
  }
  num? id;
  String? title;
  String? type;
  List<BannerItem>? bannerItem;


// HomeModelWithBannerItems copyWith({  num? id,
//   String? title,
//   String? type,
//   List<BannerItem>? bannerItem,
// }) => HomeModelWithBannerItems(  id: id ?? this.id,
//   title: title ?? this.title,
//   type: type ?? this.type,
//   bannerItem: bannerItem ?? this.bannerItem,
// );
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['title'] = title;
//     map['type'] = type;
//     if (bannerItem != null) {
//       map['banner_item'] = bannerItem?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }

}