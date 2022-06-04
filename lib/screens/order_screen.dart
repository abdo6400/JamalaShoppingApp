import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class OrderScreen extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
      child: SlideTransitionAnimation(child: OrderScreen()),
      name: jamalapages.orderPage,
      key: ValueKey(jamalapages.orderPage),
    );
  }
  const OrderScreen({Key? key}) : super(key: key);
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('قائمة الطلبات'),
            centerTitle: true,
          ),
          body: OrderListView(),
        ));
  }
}
