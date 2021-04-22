class MOrdersModel {
  List<Data> data;

  MOrdersModel({this.data});

  MOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String dating;
  String startTime;
  String endTime;
  String type;
  String typeOrder;
  int memberId;
  int userId;
  String address;
  int cost;
  String done;
  var packageId;
  String start;
  String end;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.dating,
        this.startTime,
        this.endTime,
        this.type,
        this.typeOrder,
        this.memberId,
        this.userId,
        this.address,
        this.cost,
        this.done,
        this.packageId,
        this.start,
        this.end,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dating = json['dating'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    type = json['type'];
    typeOrder = json['type_order'];
    memberId = json['member_id'];
    userId = json['user_id'];
    address = json['address'];
    cost = json['cost'];
    done = json['done'];
    packageId = json['package_id'];
    start = json['start'];
    end = json['end'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dating'] = this.dating;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['type'] = this.type;
    data['type_order'] = this.typeOrder;
    data['member_id'] = this.memberId;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['cost'] = this.cost;
    data['done'] = this.done;
    data['package_id'] = this.packageId;
    data['start'] = this.start;
    data['end'] = this.end;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
