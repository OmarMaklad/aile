class PackageModel {
  Data data;

  PackageModel({this.data});

  PackageModel.fromJson(Map<String, dynamic> json) {
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
  int months;
  int cost;
  String name;
  String description;

  Data({this.image, this.months, this.cost, this.name, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    months = json['months'];
    cost = json['cost'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['months'] = this.months;
    data['cost'] = this.cost;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
