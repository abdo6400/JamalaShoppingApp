import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';
class Auth with ChangeNotifier {
  String? _token;
  String? _userId;
  Map<String,String>? userInfo;
  void setUserInfo(Map<String,String>? userInfo){
    this.userInfo = userInfo;
    notifyListeners();
  }
  bool get isAuth {
    return token != null;
  }
  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }
  String? get userId {
    return _userId;
  }
  Future<bool> _authenticate(String email, String password, String urlSeg,bool? checkstaylogin) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSeg?key=${Constant.apikey}');
    try {
      final res = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(res.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      notifyListeners();
      if(checkstaylogin!=null &&checkstaylogin){
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': _token,
          'userId': _userId,
        });
        prefs.setString('userData', userData);
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }
  Future<bool> checkLogin()async{
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if(userData!=null){
      final data = json.decode(userData);
      _token = data['token'];
      _userId = data['userId'];
      notifyListeners();
      return true;
    }
    return false;
  }
  Future<bool> SignUp(String email,String user_name,String phoneNumber, String password) async{
    try{
        Future<bool> checkauth = _authenticate(email, password, "signUp",null);
        bool check = await checkauth;
        if(check){
          final url = Uri.parse("${Constant.apiLinkFirestore}/databases/(default)/documents/users/:commit/$_userId");
          Map<String, String> headers = {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'
          };
          final res = await http.post(url,
              body: json.encode(
                  {
                    "fields": {
                      'email': {"stringValue": email},
                      'user_name': {"stringValue": user_name},
                      'phoneNumber' : {"stringValue": phoneNumber}
                    }
                  }
              ),headers: headers
          );
          final responseData = json.decode(res.body);
          print(responseData);
          if (responseData['error'] != null) {
            throw HttpException(responseData['error']['message']);
          }
          return checkauth;
        }else{
          return false;
        }
    }catch(e){
      rethrow;
    }
  }
  Future<bool> LogIn(String email, String password,bool? checkstaylogin) async{
     Future<bool> checkauth =_authenticate(email, password, "signInWithPassword",checkstaylogin);
     return checkauth;
  }
  Future<bool> changePassword(String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    }catch(e){
      rethrow;
    }
  }
  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      if (list.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }
  Future<bool> sendEmail(String email)async{
    try{
      FirebaseAuth auth =  FirebaseAuth.instance;
      var acs = ActionCodeSettings(
          url: Constant.emaillink,
          handleCodeInApp: true,
          androidPackageName:"com.example.jamala",
          );
      await auth.sendSignInLinkToEmail(email: email, actionCodeSettings: acs);
      return true;
    }catch(e){
      rethrow;
    }
  }
  Future<void> Logout() async {
    _token = null;
    _userId = null;
    notifyListeners();
  }
}

