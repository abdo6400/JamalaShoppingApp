class category {
  int? id;
  String? name;
  String? image;
  List<Producttest>? product;

  category({this.id, this.name, this.image, this.product});

  category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['product'] != null) {
      product = <Producttest>[];
      json['product'].forEach((v) {
        product!.add(new Producttest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Producttest {
  int? id;
  String? name;
  String? image;
  int? price;
  int? count;

  Producttest({this.id, this.name, this.image, this.price, this.count});

  Producttest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['count'] = this.count;
    return data;
  }
}
