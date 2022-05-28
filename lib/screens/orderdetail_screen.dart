import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';

class OrderDetailScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const OrderDetailScreen(),
      name: jamalapages.orderdetailPage,
      key: ValueKey(jamalapages.orderdetailPage),
    );
  }

  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:
            Provider.of<OrderStateManager>(context, listen: false).statcontent
                ? Text("")
                : Text(
                    'تفاصيل الطلب',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Provider.of<OrderStateManager>(context, listen: false).statcontent
          ? Container(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.08),
              height: size.height,
              width: size.width,
              child: Container(
                width: size.width,
                child: Stepper(
                  onStepCancel: (){

                  },
                  onStepContinue: (){

                  },
                  steps: [
                    Step(
                        title: Text("ongoing"),
                        state: StepState.complete,
                        subtitle: Text("ongoing"),
                        content: Container(),
                        isActive: true),
                    Step(title: Text("onshopping"), content: Container()),
                    Step(title: Text("oncomplete"), content: Container()),
                  ],
                ),
              ),
            )
          : OrderDetailListView(),
    ));
  }
}
