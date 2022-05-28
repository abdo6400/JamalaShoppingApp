import 'package:flutter/material.dart';

class OrderStateManager extends ChangeNotifier {
  bool _OrderdetailScreen = false;
  bool _statcontent = false;
  bool get OrderdetailScreen => _OrderdetailScreen;
  bool get statcontent => _statcontent;
  void setstatcontent(bool val){
    _statcontent=val;
    notifyListeners();
  }
  void setOrderdetail(bool val){
    _OrderdetailScreen=val;
    notifyListeners();
  }
}