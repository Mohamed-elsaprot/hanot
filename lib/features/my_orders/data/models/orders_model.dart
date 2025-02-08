class OrdersModelRes {
  int? currentPage;
  List<MyOrderModel>? ordersList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  OrdersModelRes(
      {this.currentPage,
      this.ordersList,
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
      this.total});

  OrdersModelRes.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      ordersList = <MyOrderModel>[];
      json['data'].forEach((v) {
        ordersList!.add(MyOrderModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  OrdersModelRes copyWith({required next, required List<MyOrderModel> list}) =>
      OrdersModelRes(
        ordersList: list,
        nextPageUrl: next,
      );
}

class MyOrderModel {
  int? id;
  Customer? customer;
  String? paymentMethod;
  String? deliveryMethod;
  int? deliveryFee;
  String? coupon;
  int? status;
  String? statusName;
  String? statusColor;
  Address? address;
  String? shippingCompany;
  String? timeDiff;
  String? createdAt;
  int? productsCount;
  String? subtotal;
  num? discount;
  String? total;

  MyOrderModel(
      {this.id,
      this.customer,
      this.paymentMethod,
      this.deliveryMethod,
      this.deliveryFee,
      this.coupon,
      this.status,
      this.statusName,
      this.statusColor,
      this.address,
      this.shippingCompany,
      this.timeDiff,
      this.createdAt,
      this.productsCount,
      this.subtotal,
      this.discount,
      this.total});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    paymentMethod = json['payment_method'];
    deliveryMethod = json['delivery_method'];
    deliveryFee = json['delivery_fee'];
    coupon = json['coupon'];
    status = json['status'];
    statusName = json['status_name'];
    statusColor = json['status_color'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    shippingCompany = json['shipping_company'];
    timeDiff = json['time_diff'];
    createdAt = json['created_at'];
    productsCount = json['products_count'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    total = json['total'];
  }
}

class Customer {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  Customer({this.id, this.name, this.email, this.phone, this.image});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }
}


class Address {
  int? id;
  String? city;
  String? country;
  String? postalCode;
  String? streetName;
  String? homeAddress;
  String? neighborhood;

  Address(
      {this.id,
      this.city,
      this.country,
      this.postalCode,
      this.streetName,
      this.homeAddress,
      this.neighborhood});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postal_code'];
    streetName = json['street_name'];
    homeAddress = json['home_address'];
    neighborhood = json['neighborhood'];
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}


