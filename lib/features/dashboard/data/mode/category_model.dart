class CategoryModel {
  String? sId;
  String? name;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryModel(
      {this.sId,
        this.name,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
