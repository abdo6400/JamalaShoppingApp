import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/api.dart';

class CategoryProvider extends ChangeNotifier {
  List<category> _CategoryList = [];
  Future<void> getCategories() async {
    List<category> _List = [];
    var jsonobj = await Api_functions.getRequest(
        "https://myjson.dit.upm.es/api/bins/3c65");
    if (jsonobj != "404" || jsonobj != "500") {
      jsonobj.forEach((val) {
        category item = category.fromJson(val);
        _List.add(item);
      });
      _CategoryList = _List;
      notifyListeners();
    }
  }
  List<category> get CategoryList => _CategoryList;
  List<Producttest> getProducts(int index) {
    return _CategoryList[index].product!;
  }
  List<Producttest> getallproduct() {
    List<Producttest> list = [];
    _CategoryList.forEach((categ) {
      for (int i = 0; i < categ.product!.length; i++) {
        Producttest prod = categ.product![i];
        if (!list.contains(prod)) list.add(prod);
      }
    });
    return list;
  }
  List<Producttest> getbestproductsold() {
    List<Producttest> list = [];
    _CategoryList.forEach((categ) {
      int max = categ.product![0].count!;
      int maxindex = 0;
      for (int i = 0; i < categ.product!.length; i++) {
        Producttest prod = categ.product![i];
        if (prod.count! > max) {
          max = prod.count!;
          maxindex = i;
        }
      }
      if (!list.contains(categ.product![maxindex])) {
        list.add(categ.product![maxindex]);
      }
    });
    return list;
  }
}
