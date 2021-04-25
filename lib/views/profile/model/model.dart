class ProfileModel {
  Data data;

  ProfileModel({this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String image;
  String name;
  String email;
  String phone;
  Null packageId;

  Data({this.image, this.name, this.email, this.phone, this.packageId});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    packageId = json['package_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['package_id'] = this.packageId;
    return data;
  }
}
