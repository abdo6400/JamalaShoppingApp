import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../jamala_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/helperwidgets.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../models/models.dart';
import '../animations/animations.dart';
import '../providers/providers.dart';

class SignScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
        child: SignScreen(),
        key: ValueKey(jamalapages.signPage),
        name: jamalapages.signPage);
  }

  const SignScreen({Key? key}) : super(key: key);

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  void didChangeDependencies() async {
    bool check = await Provider.of<Auth>(context, listen: false).checkLogin();
    if (check) {
      Provider.of<AppStateManager>(context, listen: false).setLogIn();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SignForm()
    ));
  }
}

enum AuthMode { SignIn, SignUp }

class SignForm extends StatefulWidget {
  SignForm();

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool value = false;
  bool checkLogin = false;
  String? currentval;
  String error = "";
  Timer? timer;
  final List<String> errors = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _UserNameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _PhoneNumberController = TextEditingController();
  final _PasswordController = TextEditingController();
  late AuthMode _authMode;

  @override
  void initState() {
    super.initState();
    _authMode = AuthMode.SignIn;
    errors.clear();
  }
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  Future<void> checkverification() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance
          .getDynamicLink(Uri.parse(Constant.emaillink));
      if (data != null) {
        bool val = auth.isSignInWithEmailLink(data.link.toString());
        timer != null ? timer!.cancel() : false;
        Navigator.of(context, rootNavigator: true).pop();
        if (val) {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: "+20" + _PhoneNumberController.text,
            verificationCompleted: (PhoneAuthCredential credential) {},
            timeout: const Duration(seconds: 30),
            verificationFailed: (FirebaseAuthException e) {
              if (e.code == 'invalid-phone-number') {
                snackBar(context, "The provided phone number is not valid.",
                    MediaQuery.of(context).size.width * 0.3);
              } else {
                snackBar(context, "${e.message}",
                    MediaQuery.of(context).size.width * 0.3);
              }
            },
            codeSent: (String verificationId, int? code) async {
              setState(() {
                checkLogin = false;
              });
              Provider.of<Auth>(context, listen: false).setUserInfo({
                'email': _EmailController.text,
                'user_name': _UserNameController.text,
                'password': _PasswordController.text,
                'phoneNumber': _PhoneNumberController.text,
                'verificationId': verificationId
              });
              Provider.of<AppStateManager>(context, listen: false)
                  .setauthotp(true);
              setState(() {
                _authMode = AuthMode.SignIn;
              });
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
        } else {
          snackBar(
              context, "YOU FAILD", MediaQuery.of(context).size.width * 0.3);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 50),
          curve: Curves.slowMiddle,
          height: _authMode == AuthMode.SignIn?size.height*0.125:size.height*0.1,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.blue.shade700,
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.5
                  )
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                    color: Colors.grey[500]!),
                BoxShadow(
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                    color: Colors.white)
              ]),
        ),
        checkLogin ?Padding(
           padding: EdgeInsets.only(top: size.height*0.03),
           child: Align(
             alignment: Alignment.topCenter,
               child: const CircularProgressIndicator(
                 color: Colors.white,
                 backgroundColor: Colors.blueAccent,
               )
           ),
         ):Container(),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: _authMode == AuthMode.SignIn?size.height * 0.1:size.height * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _authMode == AuthMode.SignIn
                    ? Column(
                  children: [
                    CircleAvatar(
                      maxRadius: size.height*0.06,
                      backgroundColor: Colors.white,
                      child: Material(
                        elevation: 4,
                        animationDuration: Duration(milliseconds: 50),
                        shadowColor: Colors.blueAccent,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                            maxRadius: size.height*0.055,
                            backgroundColor: Colors.white,
                            child: const Image(
                              image: AssetImage("assets/icons/store.png"),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      "مرحبا بك",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30,
                          color: Color.fromRGBO(50, 50, 50, 0.6)
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.blueAccent,
                          shadows: [
                            BoxShadow(
                              color: Colors.blue,
                              spreadRadius: 15,
                              offset: Offset(-1, -1),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )
                    : Padding(
                  padding: EdgeInsets.only(right: size.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "إنشاء حساب ",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                color: Colors.blue,
                                spreadRadius: 15,
                                offset: Offset(-1, -1),
                              )
                            ]
                        ),
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                      CircleAvatar(
                        maxRadius: size.height*0.055,
                        backgroundColor: Colors.white,
                        child: Material(
                          elevation: 4,
                          animationDuration: Duration(milliseconds: 50),
                          shadowColor: Colors.blueAccent,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                              maxRadius: size.height*0.05,
                              backgroundColor: Colors.white,
                              child: const Image(
                                image: AssetImage("assets/icons/store.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.06,
                        left: size.width * 0.06,
                        top: size.height * 0.03,
                        bottom: 0),
                    child:  Form(
                      key: _formKey,
                      child: Column(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                controller: _EmailController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.01,
                                      horizontal: size.width * 0.02),
                                  border: InputBorder.none,
                                  constraints: BoxConstraints(
                                      maxHeight: size.height * 0.1,
                                      maxWidth: size.width),
                                  hintText: "ادخل بريدك الالكتروني",
                                  hintTextDirection: TextDirection.rtl,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.05),
                                    child: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value){
                                  if (value != null || value.contains("@")) {
                                    removeError(error:  "الرجاء ادخال بريد الالكتروني صالح");
                                  }
                                },
                                validator: (value) {
                                  if (value == null || !value.contains("@")) {
                                    addError(error: "الرجاء ادخال بريد الالكتروني صالح");
                                    //return "";
                                  }else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.01,
                                      horizontal: size.width * 0.02),

                                  constraints: BoxConstraints(
                                      maxHeight: size.height * 0.1,
                                      maxWidth: size.width),
                                  border: InputBorder.none,
                                  hintText: "ادخل كلمة المرور",
                                  hintTextDirection: TextDirection.rtl,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.05),
                                    child: const Icon(
                                      Icons.lock,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                onChanged: (value){
                                  if (value != null ||
                                      value.length > 7 ||
                                      value.length < 15) {
                                    removeError(error:  "كلمة مرور غير صحيحة");
                                  }
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.length < 7 ||
                                      value.length > 15) {
                                    addError(error: "كلمة مرور غير صحيحة");
                                    //return "";
                                  }else{
                                    return null;
                                  }
                                },
                                controller: _PasswordController,
                              ),
                            ),
                            if (_authMode == AuthMode.SignUp)
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            if (_authMode == AuthMode.SignUp)
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: "اعادة ادخال كلمة المرور",
                                      hintTextDirection: TextDirection.rtl,
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(left: size.width * 0.05),
                                        child: const Icon(
                                          Icons.password_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.02,
                                          vertical: size.height * 0.01),
                                      constraints: BoxConstraints(
                                          maxHeight: size.height * 0.1,
                                          maxWidth: size.width),
                                      border: InputBorder.none
                                  ),
                                  onChanged: (value){
                                    if (value != null ||
                                        value == _PasswordController.text) {
                                      removeError(error:  "كلمة المرور غير متطابقة");
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value != _PasswordController.text) {
                                      addError(error: "كلمة المرور غير متطابقة");
                                      //return "";
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            if (_authMode == AuthMode.SignUp)
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            if (_authMode == AuthMode.SignUp)
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  controller: _UserNameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.01,
                                        horizontal: size.width * 0.02),
                                    constraints: BoxConstraints(
                                        maxHeight: size.height * 0.1,
                                        maxWidth: size.width),
                                    hintText: "اسم المستخدم",
                                    hintTextDirection: TextDirection.rtl,
                                    prefixIcon: Padding(
                                      padding:
                                      EdgeInsets.only(left: size.width * 0.05),
                                      child: const Icon(
                                        Icons.supervised_user_circle_outlined,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                  onChanged: (value){
                                    if (value != null || value.length > 3) {
                                      removeError(error:  "الرجاء ادخال اسم المستخدم");
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.length < 3) {
                                      addError(error: "الرجاء ادخال اسم المستخدم");
                                      //return "";
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            if (_authMode == AuthMode.SignUp)
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            if (_authMode == AuthMode.SignUp)
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  controller: _PhoneNumberController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.01,
                                        horizontal: size.width * 0.02),
                                    constraints: BoxConstraints(
                                        maxHeight: size.height * 0.1,
                                        maxWidth: size.width),
                                    hintText: "ادخل رقم الهاتف",
                                    hintTextDirection: TextDirection.rtl,
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding:
                                      EdgeInsets.only(left: size.width * 0.05),
                                      child: const Icon(
                                        Icons.phone,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value){
                                    if (value != null || value.length == 11) {
                                      removeError(error:  "الرجاء ادخال رقم هاتف صحيح");
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.length != 11) {
                                      addError(error: "الرجاء ادخال رقم هاتف صحيح");
                                      //return "";
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                           errors.isEmpty?Container():Container(
                              height: size.height*0.06,
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                              child: ListView.builder(
                                  itemCount: errors.length,
                                  itemBuilder: (ctx,index){
                                    return Text("${errors[index]}",style: TextStyle(color: Colors.red),);
                                  }),
                            ),
                            if (_authMode != AuthMode.SignUp)
                              Padding(
                                padding: EdgeInsets.only(right: size.width * 0.04),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "البقاء قيد التسجيل",
                                      style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(50, 50, 50, 0.9)),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Checkbox(
                                        activeColor: Colors.blue,
                                        value: value,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)),
                                        onChanged: (val) {
                                          setState(() {
                                            value = val!;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                          ],
                        ),
                    ),
                    ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()&&errors.isEmpty){
                      setState(() {
                        checkLogin = true;
                      });
                      if (_authMode == AuthMode.SignUp) {
                        try {
                          bool val =
                          await Provider.of<Auth>(context, listen: false)
                              .checkIfEmailInUse(_EmailController.text);
                          if (!val) {
                            await Provider.of<Auth>(context, listen: false)
                                .sendEmail(_EmailController.text);
                            timer = Timer.periodic(const Duration(seconds: 1),
                                    (Timer t) => checkverification());
                            setState(() {
                              checkLogin = false;
                            });
                            showDailog(
                                context,
                                "  الرجاء تاكيد الاميل المرسل علي " +
                                    _EmailController.text);
                          } else {
                            setState(() {
                              checkLogin = false;
                            });
                            Fluttertoast.showToast(
                                msg:
                                "This is already exist ,please choose another one",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        } catch (e) {
                          setState(() {
                            _authMode = AuthMode.SignUp;
                            checkLogin = false;
                          });
                          showDailog1(context, "$e");
                        }
                      } else {
                        try {
                         /* bool val =
                          await Provider.of<Auth>(context, listen: false)
                              .LogIn(_EmailController.text,
                              _PasswordController.text, value);*/
                          if (true) {
                            setState(() {
                              checkLogin = false;
                            });
                            Provider.of<AppStateManager>(context, listen: false)
                                .setLogIn();
                          }
                        } catch (e) {
                          setState(() {
                            checkLogin = false;
                          });
                          showDailog1(context, "$e");
                        }
                      }
                    }
                  },
                  child: Container(
                    height: size.height / 16,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.shade700,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                              color: Colors.grey[500]!),
                          BoxShadow(
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1,
                              color: Colors.white)
                        ]),
                    child: Center(
                      child: Text(
                        _authMode != AuthMode.SignUp
                            ? "تسجيل الدخول"
                            : "إنشاء الحساب ",
                        style: const TextStyle(fontSize: 17,color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            errors.clear();
                            if (_authMode == AuthMode.SignUp) {
                              _authMode = AuthMode.SignIn;
                            } else {
                              _authMode = AuthMode.SignUp;
                            }
                          });
                        },
                        child: Text(
                          _authMode == AuthMode.SignUp
                              ? " .تسجيل الدخول"
                              : "!انشاء حساب",
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () async {
                          if (_authMode == AuthMode.SignUp) {
                            setState(() {
                              _authMode = AuthMode.SignIn;
                            });
                          } else {
                            if (_formKey.currentState!.validate()&&errors.isEmpty) {
                              try {
                                bool val =
                                await Provider.of<Auth>(context, listen: false)
                                    .checkIfEmailInUse(_EmailController.text);
                                if (val) {
                                  Provider.of<Auth>(context, listen: false)
                                      .setUserInfo({
                                    'email': _EmailController.text,
                                    'password': _PasswordController.text,
                                  });
                                  Provider.of<AppStateManager>(context,
                                      listen: false)
                                      .setforgetpass(true);
                                } else {
                                  snackBar(
                                      context, "الاميل غير صحيح", size.width * 0.3);
                                }
                              } catch (e) {
                                snackBar(context, "$e", size.width * 0.3);
                              }
                            }
                          }
                        },
                        child: Text(
                          _authMode == AuthMode.SignUp
                              ? " لديك حساب بالفعل؟"
                              : "اعادة تعين كلمة المرور ؟",
                          style: const TextStyle(color: Color.fromRGBO(50, 50, 50, 0.9)),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
