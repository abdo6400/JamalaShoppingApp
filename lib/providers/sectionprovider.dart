import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamalashoppingapp/constant.dart';
import 'package:jamalashoppingapp/providers/datamodels/product.dart';
import 'package:jamalashoppingapp/providers/datamodels/sections.dart';
import '../models/models.dart';
import '../services/api.dart';

class SectionProvider extends ChangeNotifier {

  List<Section> _SectionList = [];
  Future<void> getCategories() async {
    Map<String,dynamic>? decodedata = await Api_functions.getRequest("${Constant.apiLinkFirestore}/databases/(default)/documents/sections/:commit/section");
    Sections sections = new Sections.fromJson(decodedata!);
    _SectionList = sections.SectionsData!;
    notifyListeners();
  }
  List<Section> get CategoryList => _SectionList;
  List<Product>? getProducts(int index) {
    return _SectionList[index].products;
  }
  List<Product> getallproduct() {
    List<Product> list = [];
    _SectionList.forEach((categ) {
      for (int i = 0; i < categ.products!.length; i++) {
        Product prod = categ.products![i];
        if (!list.contains(prod)) list.add(prod);
      }
    });
    return list;
  }
  List<Product> getbestproductsold() {
    List<Product> list = [];
    _SectionList.forEach((categ) {
      int max = int.parse(categ.products![0].count!);
      int maxindex = 0;
      for (int i = 0; i < categ.products!.length; i++) {
        Product prod = categ.products![i];
        if (int.parse(prod.count!) > max) {
          max = int.parse(prod.count!);
          maxindex = i;
        }
      }
      if (!list.contains(categ.products![maxindex])) {
        list.add(categ.products![maxindex]);
      }
    });
    return list;
  }
}