import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class NotificationScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: SlideTransitionAnimation(child:NotificationScreen(),),
      name: jamalapages.notificationPage,
      key: ValueKey(jamalapages.notificationPage),
    );
  }

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('الرسائل',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: const NotifiactionListView(),
    ));
  }
}
