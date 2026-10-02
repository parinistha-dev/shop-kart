class WishlistModel {
  String? sId;
  String? userId;
  ProductId? productId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WishlistModel(
      {this.sId,
        this.userId,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    productId = json['productId'] != null
        ? new ProductId.fromJson(json['productId'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.productId != null) {
      data['productId'] = this.productId!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ProductId {
  String? sId;
  String? name;
  List<String>? images;
  String? description;
  int? rating;
  int? originalPrice;
  int? sellingPrice;
  double? discountPercentage;
  int? stock;
  List<String>? tags;
  String? categoryId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductId(
      {this.sId,
        this.name,
        this.images,
        this.description,
        this.rating,
        this.originalPrice,
        this.sellingPrice,
        this.discountPercentage,
        this.stock,
        this.tags,
        this.categoryId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    description = json['description'];
    rating = json['rating'];
    originalPrice = json['originalPrice'];
    sellingPrice = json['sellingPrice'];
    discountPercentage = json['discountPercentage'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    categoryId = json['categoryId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['originalPrice'] = this.originalPrice;
    data['sellingPrice'] = this.sellingPrice;
    data['discountPercentage'] = this.discountPercentage;
    data['stock'] = this.stock;
    data['tags'] = this.tags;
    data['categoryId'] = this.categoryId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
