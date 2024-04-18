import 'Addresses.dart';
import 'Links.dart';

class CustomerAddressesModel {
  CustomerAddressesModel({
      this.currentPage, 
      this.addressesList,
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.links, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,});

  CustomerAddressesModel.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      addressesList = [];
      json['data'].forEach((v) {
        addressesList?.add(Address.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  num? currentPage;
  List<Address>? addressesList;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  num? perPage;
  dynamic prevPageUrl;
  num? to;
  num? total;
CustomerAddressesModel copyWith({  num? currentPage,
  List<Address>? addresses,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  dynamic nextPageUrl,
  String? path,
  num? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => CustomerAddressesModel(  currentPage: currentPage ?? this.currentPage,
  addressesList: addresses ?? this.addressesList,
  firstPageUrl: firstPageUrl ?? this.firstPageUrl,
  from: from ?? this.from,
  lastPage: lastPage ?? this.lastPage,
  lastPageUrl: lastPageUrl ?? this.lastPageUrl,
  links: links ?? this.links,
  nextPageUrl: nextPageUrl ?? this.nextPageUrl,
  path: path ?? this.path,
  perPage: perPage ?? this.perPage,
  prevPageUrl: prevPageUrl ?? this.prevPageUrl,
  to: to ?? this.to,
  total: total ?? this.total,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (addressesList != null) {
      map['data'] = addressesList?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}