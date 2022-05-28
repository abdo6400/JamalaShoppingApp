import 'dart:math';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class InformationScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const InformationScreen(),
      name: jamalapages.informationPage,
      key: ValueKey(jamalapages.informationPage),
    );
  }

  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final Color color = Colors.primaries[Random().nextInt(17)];
  final name = TextEditingController();
  final phone_number = TextEditingController();
  final city = TextEditingController();
  final goverment = TextEditingController();
  final street = TextEditingController();
  final note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('البيانات',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height*0.8,
          width: size.width,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.05),
          child: Form(
            child: ListView(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "ادخل الاسم",
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(Icons.perm_identity_rounded),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: phone_number,
                  decoration: InputDecoration(
                    hintText: "ادخل رقم التلفون",
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(Icons.phone),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: goverment,
                  decoration: InputDecoration(
                    hintText: "ادخل المحافظة",
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(Icons.local_activity),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: city,
                  decoration: InputDecoration(
                    hintText: "ادخل المدينة",
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(Icons.location_city),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: street,
                  decoration: InputDecoration(
                    hintText: "ادخل الشارع",
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(Icons.streetview),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: note,
                  decoration: InputDecoration(
                    hintText: "ادخل ملاحظات",
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(Icons.note),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(20),
                                color: Colors.white10,
                              ),
                              child: AlertDialog(
                                content: Directionality(
                                    textDirection:
                                    TextDirection.rtl,
                                    child: Text(
                                        "هل تريد ازالة هذا المنتج ")),
                                actionsAlignment:
                                MainAxisAlignment.start,
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop(); ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          key: ValueKey("1"),
                                          duration: Duration(
                                              milliseconds: 1000
                                          ),
                                          content: Text("تم اضافة العنصر الي المفضلة",textAlign: TextAlign.center,),
                                          backgroundColor: color,
                                          padding: EdgeInsets.symmetric(horizontal: size.width*0.2),

                                        ),
                                      );
                                      Future.delayed(
                                          Duration(
                                              milliseconds: 1000
                                          ) ,() {
                                         Provider.of<PageStateManager>(context,listen: false).setorder(true);
                                        Navigator.of(context).pop();
                                      }
                                      );
                                    },
                                    child: Text(
                                      "حسنا",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text(
                                      "لا",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                ],
                              )));
                    },
                    child: Text("تاكيد الطلب"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateColor.resolveWith((states) => Colors.green),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("الغاء الطلب"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateColor.resolveWith((states) => Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
