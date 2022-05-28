import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/helperwidgets.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../providers/providers.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthOtpScreen extends StatefulWidget {
  const AuthOtpScreen();

  static MaterialPage page() {
    return const MaterialPage(
      child: AuthOtpScreen(),
      name: jamalapages.authotpPage,
      key:  ValueKey(jamalapages.authotpPage),
    );
  }

  @override
  _AuthOtpScreenState createState() => _AuthOtpScreenState();
}

class _AuthOtpScreenState extends State<AuthOtpScreen> {
  String? currentval;
  bool checkresend = false;
  int _counter = 0;
  bool active=true;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  void resendVerificationCode(String phoneNumber) async {
    try{
      setState(() {
        _counter=30;
        checkresend = true;
        active=false;
      });
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+20" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        timeout: const Duration(seconds: 30),
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? code) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
       ).then((value) => setState(() {
        checkresend = false;
      }));
    }catch(e){
      setState(() {
        checkresend = false;
      });
     snackBar(context,"$e", MediaQuery.of(context).size.width * 0.3);
    }
  }
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      }else{
        setState(() {
          checkresend = false;
          active=true;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Map<String, String>? userInfo =
        Provider.of<Auth>(context, listen: false).userInfo;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "تاكيد البيانات",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
        child: ListView(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: size.height * 0.05,
              child: Image(
                image: const AssetImage('assets/icons/pancode.png'),
                height: size.height * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              width: size.width,
              child: const Text(
                "الرجاء ادخل الرمز المرسل علي هاتفك",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: PinCodeTextField(
                keyboardType: TextInputType.phone,
                appContext: context,
                length: 6,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: Colors.grey,
                    fieldHeight: size.height * 0.05,
                    fieldWidth: size.width * 0.1,
                    activeFillColor: Colors.white,
                    disabledColor: Colors.white,
                    inactiveColor: Colors.grey),
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: const Duration(milliseconds: 300),
                onChanged: (value) {
                  setState(() {
                    currentval = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(_counter==0?"":"$_counter"),
                const SizedBox(width: 10,),
                active?TextButton(
                  onPressed: () => resendVerificationCode(userInfo!["phoneNumber"]!),
                  child: const Text("اعادة ارسال الكود"),
              ):const Text("اعادة ارسال الكود",style: TextStyle(color: Colors.blueAccent),),
            ],),
            checkresend?Transform.scale(scale: 0.2, child: const CircularProgressIndicator() ): Container(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blue)),
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  try {
                    if (currentval != null && currentval!.length >= 6 &&userInfo != null) {
                          PhoneAuthCredential _authCredential =
                              PhoneAuthProvider.credential(
                                  verificationId: userInfo["verificationId"]!,
                                  smsCode: currentval!);
                          final result = auth.signInWithCredential(_authCredential);
                          result.whenComplete(()async{
                              bool val = await Provider.of<Auth>(context,
                              listen: false)
                                  .SignUp(
                              userInfo["email"]!,
                              userInfo["user_name"]!,
                              userInfo["phoneNumber"]!,
                              userInfo["password"]!);
                             if (val) {
                                Provider.of<AppStateManager>(context,
                                    listen: false)
                                    .setsucceedsign(true);
                              }
                          });
                  } else {
                    snackBar(context, "الرجاء ادخال رمز صحيح", MediaQuery.of(context).size.width * 0.3);
                  }} catch (e) {
                    auth.signOut();
                    showDailog1(context, "$e");
                  }
                },
                child:const Text(
                  "الاستمرار",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
