import 'dart:math';

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      child: const EditScreen(),
      name: jamalapages.editPage,
      key: ValueKey(jamalapages.editPage),
    );
  }
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final email = TextEditingController();
  final phone_number = TextEditingController();
  final name = TextEditingController();
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
            title: Text('تعديل البيانات',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
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
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "ادخل الاميل",
                        hintTextDirection: TextDirection.rtl,
                        prefixIcon: Icon(Icons.email_outlined),
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
                        onPressed: () {},
                        child: Text("تاكيد التعديل"),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateColor.resolveWith((states) => Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("الغاء التعديل "),
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
