import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const HomeScreen(),
      name: jamalapages.homePage,
      key: ValueKey(jamalapages.homePage),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  static int currentIndex = 3;
  final List Pages = [
    Container(),
    NotificationScreen(),
    CartScreen(),
    MainScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: _key,
     body: Stack(
       children: [
         Pages[currentIndex],
         Positioned(
             bottom: 0,
             child: Container(
               height: size.height*0.08,
               width: size.width,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                     topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                 boxShadow: [
                   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                 ],
               ),
               child: ClipRRect(
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30.0),
                   topRight: Radius.circular(30.0),
                 ),
                 child: BottomNavigationBar(
                     type: BottomNavigationBarType.fixed,
                     selectedFontSize: 15,
                     elevation: 2.0,
                     currentIndex: currentIndex,
                     onTap: (newIndex){
                       if(newIndex==0)
                         _key.currentState!.openEndDrawer();
                       else
                         setState((){
                           currentIndex = newIndex;
                         });
                     },
                     items: [
                       BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize),label: '????????????'),
                       BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: '??????????????'),
                       BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_sharp),label: '????????????'),
                       BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: '??????????????',),

                     ]),),
             ),
         )
       ],
     ),
      endDrawer: MainDrawer(),
    ));
  }
}
