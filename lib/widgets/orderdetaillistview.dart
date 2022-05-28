import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
class OrderDetailListView extends StatefulWidget {
  const OrderDetailListView({Key? key}) : super(key: key);

  @override
  _OrderDetailListViewState createState() => _OrderDetailListViewState();
}

class _OrderDetailListViewState extends State<OrderDetailListView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding : EdgeInsets.only(top: size.height*0.02,right: size.width*0.03,left: size.width*0.03,),
        child: ListView.separated(
          itemCount: 9,
          itemBuilder: (ctx,index){
            return CartItem(index:index+1);
          },
          separatorBuilder: (ctx,index){
            return SizedBox(
              height: size.height*0.01,
            );
          },
        ),
    );
  }
}

