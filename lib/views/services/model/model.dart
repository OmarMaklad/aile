class ServiceModel {
  Service service;
  List<All> all;
  List<Recommend> recommend;

  ServiceModel({this.service, this.all, this.recommend});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    if (json['all'] != null) {
      all = new List<All>();
      json['all'].forEach((v) {
        all.add(new All.fromJson(v));
      });
    }
    if (json['recommend'] != null) {
      recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        recommend.add(new Recommend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.service != null) {
      data['service'] = this.service.toJson();
    }
    if (this.all != null) {
      data['all'] = this.all.map((v) => v.toJson()).toList();
    }
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Service {
  String name;

  Service({this.name});

  Service.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class All {
  int id;
  String name;
  int salary;
  String image;
  var rating;

  All({this.id,this.name, this.salary, this.image, this.rating});

  All.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salary = json['salary'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['salary'] = this.salary;
    data['image'] = this.image;
    data['rating'] = this.rating;
    return data;
  }
}

class Recommend {
  int id;
  String name;
  int salary;
  String image;
  var rating;

  Recommend({this.id,this.name, this.salary, this.image, this.rating});

  Recommend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salary = json['salary'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['salary'] = this.salary;
    data['image'] = this.image;
    data['rating'] = this.rating;
    return data;
  }
}