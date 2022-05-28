import 'package:flutter/material.dart';

class CarteStateManager extends ChangeNotifier {
  bool _infoScreen = false;

  bool get infoScreen => _infoScreen;
  void setInfo(bool val){
    _infoScreen=val;
    notifyListeners();
  }
}