class ProductModel {
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
  CategoryId? categoryId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductModel(
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

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    description = json['description'];
    rating = json['rating'];
    originalPrice = json['originalPrice'];
    sellingPrice = json['sellingPrice'];
    discountPercentage = double.tryParse(json['discountPercentage'].toString()) ?? 0.0;
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    categoryId = json['categoryId'] != null
        ? new CategoryId.fromJson(json['categoryId'])
        : null;
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
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId!.toJson();
    }
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CategoryId {
  String? sId;
  String? name;

  CategoryId({this.sId, this.name});

  CategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
