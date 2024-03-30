import 'package:hanot/features/categories/model/SmallCategoryModel.dart';

class HomeModelWithCategories {
  HomeModelWithCategories({
      this.id, 
      this.title, 
      this.type,
      this.categoriesList,
  });

  HomeModelWithCategories.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    if (json['data'] != null) {
      categoriesList = [];
      json['data'].forEach((v) {
        categoriesList?.add(SmallCategoryModel.fromJson(v));
      });
    }
  }
  num? id;
  String? title;
  String? type;
  List<SmallCategoryModel>? categoriesList;


// HomeModelWithCategories copyWith({  num? id,
//   String? title,
//   String? type,
// }) => HomeModelWithCategories(  id: id ?? this.id,
//   title: title ?? this.title,
//   type: type ?? this.type,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['title'] = title;
//     map['type'] = type;
//     return map;
//   }

}