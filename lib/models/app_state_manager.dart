import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppStateManager extends ChangeNotifier{
  bool _initialized = false;
  bool _logIn = false;
  bool _onboardingComplete = false;
  bool _forgetscreen = false;
  bool _authotp = false;
  bool _succeedsign = false;
  bool _restpassword = false;
  bool get initialized => _initialized;
  bool get onboardingComplete => _onboardingComplete;
  bool get forgetscreen => _forgetscreen;
  bool get authotp => _authotp;
  bool get restpassword => _restpassword;
  bool get succeedsign => _succeedsign;
  bool get logIn => _logIn;
  void initializeApp(){
    Timer(const Duration(
     milliseconds: 2000,
    ),(){
    _initialized = true;
    notifyListeners();
    }
    );
  }
  void boardingcompleted()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("staylogin", true);
  }
  Future<bool> checkboardingcompleted()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("staylogin")??false;
  }
  void setLogIn(){
    _logIn = true;
    notifyListeners();
  }
  void setforgetpass(bool val){
    _forgetscreen = val;
    notifyListeners();
  }
  void setrestpassword(bool val){
    _restpassword = val;
    notifyListeners();
  }
  void completeOnboarding(){
    _onboardingComplete = true;
    notifyListeners();
  }
  void setsucceedsign(bool val){
    _succeedsign=val;
    notifyListeners();
  }
  void setauthotp(bool val){
    _authotp=val;
    notifyListeners();
  }
  void logOut()async{
    _initialized = false;
    _logIn = false;
    _forgetscreen=false;
    _onboardingComplete = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    initializeApp();
    notifyListeners();
  }
}