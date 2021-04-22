class MDetailsModel {
  Data data;

  MDetailsModel({this.data});

  MDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String name;
  int salary;
  var rate;
  String image;
  String address;
  String description;

  Data(
      {this.name,
        this.salary,
        this.rate,
        this.image,
        this.address,
        this.description});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    salary = json['salary'];
    rate = json['rate'];
    image = json['image'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['salary'] = this.salary;
    data['rate'] = this.rate;
    data['image'] = this.image;
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}
