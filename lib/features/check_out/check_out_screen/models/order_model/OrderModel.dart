import 'Customer.dart';
import 'StatusColor.dart';
import 'Address.dart';

class OrderModel {
  OrderModel({
      this.id, 
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
      this.total,});

  OrderModel.fromJson(dynamic json) {
    id = json['id'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    paymentMethod = json['payment_method'];
    deliveryMethod = json['delivery_method'];
    deliveryFee = json['delivery_fee'];
    coupon = json['coupon'];
    status = json['status'];
    statusName = json['status_name'];
    statusColor = json['status_color']; //!= null ? StatusColor.fromJson(json['status_color']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    shippingCompany = json['shipping_company'];
    timeDiff = json['time_diff'];
    createdAt = json['created_at'];
    productsCount = json['products_count'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    total = json['total'];
  }
  num? id;
  Customer? customer;
  String? paymentMethod;
  String? deliveryMethod;
  num? deliveryFee;
  String? coupon;
  num? status;
  String? statusName;
  // StatusColor? statusColor;
  String? statusColor;
  Address? address;
  String? shippingCompany;
  String? timeDiff;
  String? createdAt;
  num? productsCount;
  String? subtotal;
  num? discount;
  String? total;
OrderModel copyWith({  num? id,
  Customer? customer,
  String? paymentMethod,
  String? deliveryMethod,
  num? deliveryFee,
  String? coupon,
  num? status,
  String? statusName,
  // StatusColor? statusColor,
  String? statusColor,
  Address? address,
  String? shippingCompany,
  String? timeDiff,
  String? createdAt,
  num? productsCount,
  String? subtotal,
  num? discount,
  String? total,
}) => OrderModel(  id: id ?? this.id,
  customer: customer ?? this.customer,
  paymentMethod: paymentMethod ?? this.paymentMethod,
  deliveryMethod: deliveryMethod ?? this.deliveryMethod,
  deliveryFee: deliveryFee ?? this.deliveryFee,
  coupon: coupon ?? this.coupon,
  status: status ?? this.status,
  statusName: statusName ?? this.statusName,
  statusColor: statusColor ?? this.statusColor,
  address: address ?? this.address,
  shippingCompany: shippingCompany ?? this.shippingCompany,
  timeDiff: timeDiff ?? this.timeDiff,
  createdAt: createdAt ?? this.createdAt,
  productsCount: productsCount ?? this.productsCount,
  subtotal: subtotal ?? this.subtotal,
  discount: discount ?? this.discount,
  total: total ?? this.total,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    map['payment_method'] = paymentMethod;
    map['delivery_method'] = deliveryMethod;
    map['delivery_fee'] = deliveryFee;
    map['coupon'] = coupon;
    map['status'] = status;
    map['status_name'] = statusName;
    if (statusColor != null) {
      map['status_color'] = statusColor;//?.toJson();
    }
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['shipping_company'] = shippingCompany;
    map['time_diff'] = timeDiff;
    map['created_at'] = createdAt;
    map['products_count'] = productsCount;
    map['subtotal'] = subtotal;
    map['discount'] = discount;
    map['total'] = total;
    return map;
  }

}