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
        body: Container(
          height: size.height,
          width: size.width,
          color: Theme.of(context).colorScheme.primary,
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
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0.1,
                            color: Colors.yellow,
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: Provider.of<AppStateManager>(context, listen: false)
                              .forgetscreen
                          ? Text(
                              "تم ارسال اميل بنجاح",
                            textAlign: TextAlign.center,
                             style: Theme.of(context).textTheme.headline4,
                            )
                          : Text(
                              "تم التسجيل بنجاح",
                          textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4,
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
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
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
                        child: Text("الذاهب لصفحة تسجيل الدخول",textAlign: TextAlign.center,)
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
