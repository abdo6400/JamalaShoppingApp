import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final int? index;

  const CartItem({Key? key, this.index}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dismissible(
      key: ValueKey(widget.index),
      onDismissed: (dir) {
        if (dir == DismissDirection.endToStart) {}
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete_forever,
              size: 50,
            )
          ],
        ),
      ),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: size.height * 0.17,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02),
          child: Row(children: [
            Expanded(
            flex: 12,
            child: Container(
              padding: EdgeInsets.only(top: size.height*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("علبة عصير",
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("معلبات",
                     ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(right: size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        " 5.0 السعر ",
                      ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                             ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.minimize,
                                ),
                              ),
                              SizedBox(width: size.width*0.01,),
                              Text(
                                "1",
                              ),
                              SizedBox(width: size.width*0.01,),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 7,
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/images/section.png"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
