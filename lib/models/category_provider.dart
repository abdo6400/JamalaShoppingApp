import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/models.dart';
import '../services/api.dart';

class CategoryProvider extends ChangeNotifier {
  static Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
  List<category> _CategoryList = [];
  Future<void> getCategories() async {
    List<category> _List = [];
    Future.delayed(const Duration(milliseconds: 3000));
    final dataString = await _loadAsset(
      'assets/sample_data/categorydata.json',
    );
    var decodedata = jsonDecode(dataString);
      decodedata.forEach((val) {
        category item = category.fromJson(val);
        _List.add(item);
      });
      _CategoryList = _List;
      notifyListeners();
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
