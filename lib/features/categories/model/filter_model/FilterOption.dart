import 'FilterItem.dart';

class FilterOption {
  FilterOption({
      this.id, 
      this.name, 
      this.filterItem,});

  FilterOption.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['values'] != null) {
      filterItem = [];
      json['values'].forEach((v) {
        filterItem?.add(FilterItem.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  List<FilterItem>? filterItem;
FilterOption copyWith({  num? id,
  String? name,
  List<FilterItem>? filterItem,
}) => FilterOption(  id: id ?? this.id,
  name: name ?? this.name,
  filterItem: filterItem ?? this.filterItem,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (filterItem != null) {
      map['values'] = filterItem?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}