import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class OrderListView extends StatefulWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  _OrderListViewState createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  bool choice = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: size.height*0.06,
              child: Container(
                height: size.height*0.9,
                width: size.width,
                padding: EdgeInsets.only(bottom: size.height*0.1),
                child:choice
                  ? ListView.separated(
                      itemBuilder: (ctx, index) {
                        return OrderItem();
                      },
                      separatorBuilder: (ctx, index) {
                        return Divider();
                      },
                      itemCount: 2)
                  : ListView.separated(
                      itemBuilder: (ctx, index) {
                        return OrderItem();
                      },
                      separatorBuilder: (ctx, index) {
                        return Divider();
                      },
                      itemCount: 4),
            ),),
            Positioned(
              top: 0,
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.01),
                width: size.width,
                child: Card(
                  margin: EdgeInsets.all(0),
                  elevation: 2.0,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            choice = false;
                          });
                        },
                        child: Text(
                          "ongoing",
                          style: TextStyle(
                              color: choice ? Colors.blueAccent : Colors.black45,
                              decoration: choice
                                  ? TextDecoration.none
                                  : TextDecoration.underline,
                              fontSize: choice ? 14 : 16,
                              shadows: [
                                Shadow(color: Colors.black26, blurRadius: 10)
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            choice = true;
                          });
                        },
                        child: Text(
                          "complete",
                          style: TextStyle(
                              color: choice ? Colors.black45 : Colors.blueAccent,
                              decoration: choice
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              fontSize: choice ? 16 : 14,
                              shadows: [
                                Shadow(color: Colors.black26, blurRadius: 10)
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
