class GetFavoritesModel {
  List<FavItemModel>? favItemsList;
  Links? links;
  Meta? meta;

  GetFavoritesModel({this.favItemsList, this.links, this.meta});

  GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      favItemsList = <FavItemModel>[];
      json['data'].forEach((v) {
        favItemsList!.add(FavItemModel.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  GetFavoritesModel copyWith({
    required List<FavItemModel>? data,
    required Links? links,
    required Meta? meta,
  }) =>
      GetFavoritesModel(
        favItemsList: data,
        links: links,
        meta: meta,
      );
}

class FavItemModel {
  int? id;
  int? productId;
  String? name;
  int? salePrice;
  int? costPrice;
  int? discountPrice;
  bool? hasCampaign;
  bool? hasOptions;
  bool? hasDiscountPrice;
  int? quantity;
  int? availableQuantity;
  String? weight;
  int? width;
  int? height;
  int? length;
  String? barcode;
  String? image;
  List<dynamic>? options;
  List<dynamic>? skus;

  FavItemModel(
      {this.id,
      this.productId,
      this.name,
      this.salePrice,
      this.costPrice,
      this.discountPrice,
      this.hasCampaign,
      this.hasOptions,
      this.hasDiscountPrice,
      this.quantity,
      this.availableQuantity,
      this.weight,
      this.width,
      this.height,
      this.length,
      this.barcode,
      this.image,
      this.options,
      this.skus});

  FavItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    salePrice = json['sale_price'];
    costPrice = json['cost_price'];
    discountPrice = json['discount_price'];
    hasCampaign = json['has_campaign'];
    hasOptions = json['has_options'];
    hasDiscountPrice = json['has_discount_price'];
    quantity = json['quantity'];
    availableQuantity = json['available_quantity'];
    weight = json['weight'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    barcode = json['barcode'];
    image = json['image'];
    if (json['options'] != null) {
      options = json['options'];
    }
    if (json['skus'] != null) {
      skus = json['skus'];
    }
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<MetaLinks>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <MetaLinks>[];
      json['links'].forEach((v) {
        links!.add(MetaLinks.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class MetaLinks {
  String? url;
  String? label;
  bool? active;

  MetaLinks({this.url, this.label, this.active});

  MetaLinks.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
