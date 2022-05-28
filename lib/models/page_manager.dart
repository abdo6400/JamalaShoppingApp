import 'package:flutter/material.dart';

class PageStateManager extends ChangeNotifier {
  int _index = 0;
  bool _carte_screen = false;
  bool _order_screen = false;
  bool _favorite_screen = false;
  bool _profile_screen = false;
  bool _notification_screen = false;
  bool _scetion_screen = false;
  bool _item_detial_screen = false;
  bool _contactus_screen = false;
  bool _edit_screen = false;
  bool get favorite_screen => _favorite_screen;
  bool get edit_screen => _edit_screen;
  bool get carte_screen => _carte_screen;
  bool get item_detial_screen => _item_detial_screen;
  bool get scetion_screen => _scetion_screen;
  bool get notification_screen => _notification_screen;
  bool get profile_screen => _profile_screen;
  bool get order_screen => _order_screen;
  void LogOut(){
    _carte_screen = false;
    _order_screen = false;
    _favorite_screen = false;
    _profile_screen = false;
    _notification_screen = false;
    _scetion_screen = false;
    _item_detial_screen = false;
     _contactus_screen = false;
    _edit_screen = false;
    notifyListeners();
  }
   /*************************/
    int get index => _index;
    void setindex(int? idx){
      if(idx!=null)
        {
        _index=idx;
        notifyListeners();
        }
      _index=0;
      notifyListeners();
     }
  /*********************/

  bool get contactus_screen => _contactus_screen;

  void setcart(bool val) {
    _carte_screen = val;
    notifyListeners();
  }

  void setcontact(bool val) {
    _contactus_screen = val;
    notifyListeners();
  }
  void setedit(bool val) {
    _edit_screen = val;
    notifyListeners();
  }
  void setorder(bool val) {
    _order_screen = val;
    notifyListeners();
  }
  void setfavorite(bool val) {
    _favorite_screen = val;
    notifyListeners();
  }
  void setprofile(bool val) {
    _profile_screen = val;
    notifyListeners();
  }
  void setitemdetial(bool val) {
    _item_detial_screen = val;
    notifyListeners();
  }
  void setsection(bool val) {
    _scetion_screen = val;
    notifyListeners();
  }
  void setnotification(bool val) {
    _notification_screen = val;
    notifyListeners();
  }
}
