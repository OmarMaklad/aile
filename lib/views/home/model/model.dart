class HomeModel {
  List<Banners> banners;
  List<Packages> packages;
  List<Services> services;

  HomeModel({this.banners, this.packages, this.services});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = new List<Packages>();
      json['packages'].forEach((v) {
        packages.add(new Packages.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  int id;
  String image;
  String name;
  String description;

  Banners({this.id, this.image, this.name, this.description});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Packages {
  int id;
  String image;
  int months;
  int cost;
  String name;
  String description;

  Packages(
      {this.id,
        this.image,
        this.months,
        this.cost,
        this.name,
        this.description});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    months = json['months'];
    cost = json['cost'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['months'] = this.months;
    data['cost'] = this.cost;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
class Services {
  int id;
  String image;
  String name;
  String description;

  Services({this.id, this.image, this.name, this.description});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
