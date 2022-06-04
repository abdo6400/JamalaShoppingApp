import 'product.dart';

class Sections{
  String? name;
  List<Section>? SectionsData;

  Sections({this.name,this.SectionsData});

  Sections.fromJson(Map<String, dynamic> json) {
    name = json["documents"][0]["name"];
    if (json["documents"] != null) {
      SectionsData = <Section>[];
      json["documents"].forEach((v) {
        SectionsData!.add(new Section.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.SectionsData != null) {
      data['product'] = this.SectionsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Section{
  String? id;
  String? name;
  String? image;
  List<Product>? products;

  Section({this.id, this.name, this.image, this.products});

  Section.fromJson(Map<String, dynamic> json) {
    image = json["fields"]["image"]["stringValue"];
    name = json["fields"]["name"]["stringValue"];
    id = json["fields"]["id"]["stringValue"];
    if (json["fields"]["product"]["arrayValue"]["values"] != null) {
      products = <Product>[];
      json["fields"]["product"]["arrayValue"]["values"].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.products != null) {
      data['product'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}