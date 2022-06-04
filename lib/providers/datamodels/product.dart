import 'package:flutter/material.dart';

class Product {
  String? id;
  String? name;
  String? image;
  String? price;
  String? count;

  Product({this.id, this.name, this.image, this.price, this.count});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["mapValue"]["fields"]["id"]["stringValue"];
    name = json["mapValue"]["fields"]["name"]["stringValue"];
    image = json["mapValue"]["fields"]["image"]["stringValue"];
    price = json["mapValue"]["fields"]["price"]["stringValue"];
    count = json["mapValue"]["fields"]["count"]["stringValue"];
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