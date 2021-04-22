class NotificationModel {
  String msg;
  List<Data> data;

  NotificationModel({this.msg, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String body;
  String bodyEn;
  String title;
  String titleEn;
  int type;
  Null deliveryId;
  Null orderId;
  int dealerId;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.body,
        this.bodyEn,
        this.title,
        this.titleEn,
        this.type,
        this.deliveryId,
        this.orderId,
        this.dealerId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    bodyEn = json['body_en'];
    title = json['title'];
    titleEn = json['title_en'];
    type = json['type'];
    deliveryId = json['delivery_id'];
    orderId = json['order_id'];
    dealerId = json['dealer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['body_en'] = this.bodyEn;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['type'] = this.type;
    data['delivery_id'] = this.deliveryId;
    data['order_id'] = this.orderId;
    data['dealer_id'] = this.dealerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
