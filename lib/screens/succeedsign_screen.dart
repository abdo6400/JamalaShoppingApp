import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../widgets/widgets.dart';
import '../animations/animations.dart';
class SucceedSignScreen extends StatefulWidget {
  const SucceedSignScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      child: FadeAnimationPage(child: SucceedSignScreen(),) ,
      name: jamalapages.succeedsignPage,
      key: ValueKey(jamalapages.succeedsignPage),
    );
  }

  @override
  _SucceedSignScreenScreenState createState() =>
      _SucceedSignScreenScreenState();
}

class _SucceedSignScreenScreenState extends State<SucceedSignScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.2, horizontal: size.width * 0.05),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage("assets/images/stars.png"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    top: size.height*0.3,
                    right: 0,
                    child: Container(
                      width: size.width*0.5,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                            spreadRadius: 0.1,
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: Provider.of<AppStateManager>(context, listen: false)
                              .forgetscreen
                          ? Text(
                              "تم ارسال اميل بنجاح",
                              style: TextStyle(fontSize: size.width*0.03,color: Colors.white),textAlign: TextAlign.center,
                            )
                          : Text(
                              "تم التسجيل بنجاح",
                          style: TextStyle(fontSize:size.width*0.03,color: Colors.white),textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height*0.1,
                    right: size.width*0.1,
                    left: size.width*0.1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(255,200,0,1))
                        ),
                        onPressed: () {
                          Provider.of<AppStateManager>(context, listen: false)
                              .setsucceedsign(false);
                          Provider.of<AppStateManager>(context, listen: false)
                              .setauthotp(false);
                          Provider.of<AppStateManager>(context, listen: false)
                              .setforgetpass(false);
                          Provider.of<AppStateManager>(context, listen: false)
                              .setrestpassword(false);
                        },
                        child: Text("الذاهب لصفحة تسجيل الدخول", style: TextStyle(fontSize: size.width*0.03,color: Colors.white),textAlign: TextAlign.center,)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
