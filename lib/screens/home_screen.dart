import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamalashoppingapp/color.dart';
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
  static int currentIndex = 0;
  final List Pages = [
    MainScreen(),
    CartScreen(),
    NotificationScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: _key,
     body: Pages[currentIndex],
      endDrawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent.shade700,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (newIndex){
            if(newIndex==3)
              _key.currentState!.openEndDrawer();
            else
              setState((){
              currentIndex = newIndex;
              });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home',),
            BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_sharp),label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: 'notification'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize),label: 'More')
      ]),
    ));
  }
}
