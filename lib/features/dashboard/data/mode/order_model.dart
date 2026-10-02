class OrderModel {
  bool? success;
  String? message;
  Order? order;

  OrderModel({this.success, this.message, this.order});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  String? userId;
  List<Items>? items;
  int? itemsTotal;
  int? deliveryCharges;
  Null couponId;
  String? couponCode;
  int? couponValue;
  int? finalAmount;
  String? paymentType;
  String? paymentStatus;
  String? orderStatus;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Order({
    this.userId,
    this.items,
    this.itemsTotal,
    this.deliveryCharges,
    this.couponId,
    this.couponCode,
    this.couponValue,
    this.finalAmount,
    this.paymentType,
    this.paymentStatus,
    this.orderStatus,
    this.sId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Order.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    itemsTotal = json['itemsTotal'];
    deliveryCharges = json['deliveryCharges'];
    couponId = json['couponId'];
    couponCode = json['couponCode'];
    couponValue = json['couponValue'];
    finalAmount = json['finalAmount'];
    paymentType = json['paymentType'];
    paymentStatus = json['paymentStatus'];
    orderStatus = json['orderStatus'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['itemsTotal'] = itemsTotal;
    data['deliveryCharges'] = deliveryCharges;
    data['couponId'] = couponId;
    data['couponCode'] = couponCode;
    data['couponValue'] = couponValue;
    data['finalAmount'] = finalAmount;
    data['paymentType'] = paymentType;
    data['paymentStatus'] = paymentStatus;
    data['orderStatus'] = orderStatus;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Items {
  String? productId;
  String? name;
  int? price;
  int? quantity;
  int? total;
  String? sId;

  Items({
    this.productId,
    this.name,
    this.price,
    this.quantity,
    this.total,
    this.sId,
  });

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['total'] = total;
    data['_id'] = sId;
    return data;
  }
}
