class StateModel {
  StateModel({
      this.status, 
      this.statusName, 
      this.color,});

  StateModel.fromJson(dynamic json) {
    status = json['status'];
    statusName = json['status_name'];
    color = json['color'];
  }
  num? status;
  String? statusName;
  String? color;
StateModel copyWith({  num? status,
  String? statusName,
  String? color,
}) => StateModel(  status: status ?? this.status,
  statusName: statusName ?? this.statusName,
  color: color ?? this.color,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_name'] = statusName;
    map['color'] = color;
    return map;
  }

}