import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Api_functions {
  static Future<dynamic> getRequest(String url) async {
   final response = await http.get(Uri.parse(url));
    /*await Future.delayed(const Duration(milliseconds: 3000));
    final dataString = await _loadAsset(
      'assets/sample_data/categorydata.json',
    );*/
   try {
      if (response.statusCode == 200) {
        String Jsondata = response.body;
        var decodedata = jsonDecode(Jsondata);
        //***********documents**************/
       /* print(decodedata["documents"][0]["name"]);
        //***********enddocuments**************/
        //********section***************//
         print(decodedata["documents"][0]["fields"]["image"]["stringValue"]);
        print(decodedata["documents"][0]["fields"]["name"]["stringValue"]);
        print(decodedata["documents"][0]["fields"]["id"]["stringValue"]);
        //********Endsection***************//
        //********sectionproducts***************//
        print(decodedata["documents"][0]["fields"]["product"]["arrayValue"]["values"][0]["mapValue"]["fields"]["count"]["stringValue"]);
        print(decodedata["documents"][0]["fields"]["product"]["arrayValue"]["values"][0]["mapValue"]["fields"]["name"]["stringValue"]);
        print(decodedata["documents"][0]["fields"]["product"]["arrayValue"]["values"][0]["mapValue"]["fields"]["id"]["stringValue"]);
        print(decodedata["documents"][0]["fields"]["product"]["arrayValue"]["values"][0]["mapValue"]["fields"]["price"]["stringValue"]);
        print(decodedata["documents"][0]["fields"]["product"]["arrayValue"]["values"][0]["mapValue"]["fields"]["image"]["stringValue"]);*/
        print(response.body);
        //********endsectionproducts***************//
        return decodedata;
      } else {
        print(response.body);
        return "404";
      }
    } catch (exp) {
      print(response.body);
      return "500";
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
