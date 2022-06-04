import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Api_functions {
  static Future<Map<String,dynamic>>? getRequest(String url) async {
   /* await Future.delayed(const Duration(milliseconds: 3000));
    final dataString = await _loadAsset(
      'assets/sample_data/categorydata.json',
    );*/
   try {
     final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String Jsondata = response.body;
        var decodedata = jsonDecode(Jsondata);
        return decodedata;
      } else {
        return {};
      }
    } catch (exp) {;
      return {};
    }
  }
  static Future<dynamic> postRequest(String url) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            "fields": {
              "id": {"stringValue": '2'},
              "name": {"stringValue":"منظفات"},
              "image": {"stringValue":"https://cdn.infodubled.dz/wp-content/uploads/2018/02/mon.png"},
             "product": {"arrayValue":{
               "values":[
                 {
                   "mapValue": {
                       "fields":{
                         "id":{
                           "stringValue":'1'
                         },
                         "name":{
                           "stringValue":'pr111sial'
                         },
                         "price":{
                           "stringValue":'2212'
                         },
                         "count":{
                           "stringValue":'1110'
                         },
                          "image":{
                           "stringValue": "http://4sat3amal.com/thumb/crop,1047x437,imagetava1516712917.png"
                          }
                       }
                   },
                 },
               ]
             }
              }
            }
          }),headers: headers
      );
      final response = json.decode(res.body);
      print(response);
      /*if (response.statusCode == 200) {
        String Jsondata = response.body;
        var decodedata = jsonDecode(Jsondata);
        print(decodedata);
        return decodedata;
      } else {
        print("400");
        return "404";
      }*/
    } catch (exp) {
      print(exp);
      print("hello");
      return "500";
    }

  }
  static Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
