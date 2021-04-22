class PreviousModel {
  List<Current> current;
  List<Pervious> pervious;

  PreviousModel({this.current, this.pervious});

  PreviousModel.fromJson(Map<String, dynamic> json) {
    if (json['current'] != null) {
      current = new List<Current>();
      json['current'].forEach((v) {
        current.add(new Current.fromJson(v));
      });
    }
    if (json['pervious'] != null) {
      pervious = new List<Pervious>();
      json['pervious'].forEach((v) {
        pervious.add(new Pervious.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.current != null) {
      data['current'] = this.current.map((v) => v.toJson()).toList();
    }
    if (this.pervious != null) {
      data['pervious'] = this.pervious.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Current {
  int id;
  String dating;
  String startTime;
  String endTime;
  String type;
  String typeOrder;
  int memberId;
  String memberName;
  String memberImg;
  int userId;
  String address;
  int cost;
  String done;
  Null packageId;

  Current(
      {this.id,
        this.dating,
        this.startTime,
        this.endTime,
        this.type,
        this.typeOrder,
        this.memberId,
        this.memberName,
        this.memberImg,
        this.userId,
        this.address,
        this.cost,
        this.done,
        this.packageId});

  Current.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dating = json['dating'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    type = json['type'];
    typeOrder = json['type_order'];
    memberId = json['member_id'];
    memberName = json['member_name'];
    memberImg = json['member_img'];
    userId = json['user_id'];
    address = json['address'];
    cost = json['cost'];
    done = json['done'];
    packageId = json['package_id'];
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
    data['member_name'] = this.memberName;
    data['member_img'] = this.memberImg;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['cost'] = this.cost;
    data['done'] = this.done;
    data['package_id'] = this.packageId;
    return data;
  }
}
class Pervious {
  int id;
  String dating;
  String startTime;
  String endTime;
  String type;
  String typeOrder;
  int memberId;
  String memberName;
  String memberImg;
  int userId;
  String address;
  int cost;
  String done;
  Null packageId;

  Pervious(
      {this.id,
        this.dating,
        this.startTime,
        this.endTime,
        this.type,
        this.typeOrder,
        this.memberId,
        this.memberName,
        this.memberImg,
        this.userId,
        this.address,
        this.cost,
        this.done,
        this.packageId});

  Pervious.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dating = json['dating'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    type = json['type'];
    typeOrder = json['type_order'];
    memberId = json['member_id'];
    memberName = json['member_name'];
    memberImg = json['member_img'];
    userId = json['user_id'];
    address = json['address'];
    cost = json['cost'];
    done = json['done'];
    packageId = json['package_id'];
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
    data['member_name'] = this.memberName;
    data['member_img'] = this.memberImg;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['cost'] = this.cost;
    data['done'] = this.done;
    data['package_id'] = this.packageId;
    return data;
  }
}


