import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../jamala_pages.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../animations/animations.dart';
import '../providers/providers.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const SplashScreen(),
      name: jamalapages.splashPage,
      key: ValueKey(jamalapages.splashPage),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppStateManager>(context,listen: false).initializeApp();
  }

  @override
  void didChangeDependencies()async{
    bool check = await Provider.of<AppStateManager>(context,listen: false).checkboardingcompleted();
    if(check){
      Future.delayed(
       const Duration(milliseconds: 1000,)
    ).then((value) => Provider.of<AppStateManager>(context,listen: false).completeOnboarding());
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Theme.of(context).primaryColor,
              child: CustomPaint(
                painter: BackgroundPaint(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height * 0.2),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Material(
                        elevation: 4,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          child: Image.asset("assets/icons/store.png"),
                          radius: size.height * 0.07,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: size.height*0.05,
                        width: size.width*0.3,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Text("جمله",style: Theme.of(context).textTheme.headline1,)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "THIS APP CREATED BY AMA",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class BackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    Path path = Path();
    paint.color = Colors.white;
    path.lineTo(0, size.height *0.6);
    path.quadraticBezierTo(size.width*0.8, size.height*0.9, size.width*1.5, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

