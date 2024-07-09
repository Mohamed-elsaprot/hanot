import 'Children.dart';
import 'Names.dart';
import 'Translations.dart';

class CategoryDetails {
  CategoryDetails({
      this.id, 
      this.parentId, 
      this.status, 
      this.sortOrder, 
      this.createdAt, 
      this.updatedAt, 
      this.image, 
      this.hasChildren, 
      this.children, 
      this.deepth, 
      this.locale, 
      this.names, 
      this.name, 
      this.translations,});

  CategoryDetails.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    status = json['status'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    hasChildren = json['has_children'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    deepth = json['deepth'];
    locale = json['locale'];
    names = json['names'] != null ? Names.fromJson(json['names']) : null;
    name = json['name'];
    if (json['translations'] != null) {
      translations = [];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }
  int? id;
  dynamic parentId;
  String? status;
  dynamic sortOrder;
  String? createdAt;
  String? updatedAt;
  String? image;
  bool? hasChildren;
  List<Children>? children;
  int? deepth;
  String? locale;
  Names? names;
  String? name;
  List<Translations>? translations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent_id'] = parentId;
    map['status'] = status;
    map['sort_order'] = sortOrder;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image'] = image;
    map['has_children'] = hasChildren;
    if (children != null) {
      map['children'] = children!.map((v) => v.toJson()).toList();
    }
    map['deepth'] = deepth;
    map['locale'] = locale;
    if (names != null) {
      map['names'] = names!.toJson();
    }
    map['name'] = name;
    if (translations != null) {
      map['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}