import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../models/models.dart';
import '../animations/animations.dart';
import '../providers/auth.dart';
class RestpasswordScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const RestpasswordScreen(),
      name: jamalapages.restpasswordPage,
      key: ValueKey(jamalapages.restpasswordPage),
    );
  }

  const RestpasswordScreen({Key? key}) : super(key: key);

  @override
  State<RestpasswordScreen> createState() => _RestpasswordScreenState();
}

class _RestpasswordScreenState extends State<RestpasswordScreen> {
  final _PasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          height: size.height * 0.6,
          padding: EdgeInsets.symmetric(vertical: size.height*0.05),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      "اعادة تعين كلمة المرور",
                    ),
                  ),
                  Container(
                    child: Image(
                      image: AssetImage('assets/icons/restpass.png'),
                      height: size.height * 0.09,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.08),
                child: Form(
                    key: _formKey2,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                                horizontal: size.width * 0.02),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            constraints: BoxConstraints(
                                maxHeight: size.height * 0.1,
                                maxWidth: size.width),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: "ادخل كلمة المرور القديمة",
                            hintTextDirection: TextDirection.rtl,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.05),
                              child: Icon(
                                Icons.lock,
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                value.length < 7 ||
                                value.length > 15) {
                              return "كلمة مرور غير صحيحة";
                            }
                            return null;
                          },
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                                horizontal: size.width * 0.02),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            constraints: BoxConstraints(
                                maxHeight: size.height * 0.1,
                                maxWidth: size.width),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: " ادخال كلمة المرور الجديده",
                            hintTextDirection: TextDirection.rtl,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.05),
                              child: Icon(
                                Icons.lock,
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                value.length < 7 ||
                                value.length > 15) {
                              return "كلمة مرور غير صحيحة";
                            }
                            return null;
                          },
                          controller: _PasswordController,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          obscureText: true,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            hintText: "اعادة ادخال كلمة المرور الجديده",
                            hintTextDirection: TextDirection.rtl,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.05),
                              child: Icon(
                                Icons.password_outlined,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            constraints: BoxConstraints(
                                maxHeight: size.height * 0.1,
                                maxWidth: size.width),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value != _PasswordController.text) {
                              return "كلمة المرور غير متطابقة";
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey2.currentState!.validate()) {
                      _formKey2.currentState!.save();
                      /*Provider.of<AppStateManager>(context, listen: false)
                          .setsucceedsign(true);*/
                    }
                  },
                  child: Text(
                    "الاستمرار",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
