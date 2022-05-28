import 'dart:math';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
class CartListView extends StatelessWidget {
   CartListView({Key? key}) : super(key: key);
  final Color color = Colors.primaries[Random().nextInt(17)];
  void showbottomsheet(BuildContext context){
    final size = MediaQuery.of(context).size;
    showModalBottomSheet<void>(
      barrierColor: Colors.white10,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height*0.3,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("pricew of jdna",style: TextStyle(color: Colors.white),),
                  Text("5055",style: TextStyle(color: Colors.white),),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("pricew of jdna",style: TextStyle(color: Colors.white),),
                  Text("5055",style: TextStyle(color: Colors.white),),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("pricew of jdna",style: TextStyle(color: Colors.white),),
                  Text("457",style: TextStyle(color: Colors.white),),
                ],
              ),
              SizedBox(height: size.height*0.03,),
              Container(
                width: size.width,
                child: ElevatedButton(
                  onPressed: (){
                    Provider.of<CarteStateManager>(context,listen: false).setInfo(true);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "تقدم بالطلب"
                    ,style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white)
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                padding: EdgeInsets.only(top: size.height*0.01,right: size.width*0.03,left: size.width*0.03,),
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
              ),
            ),
             SizedBox(
                width: size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الاستمرار",style: TextStyle(color: Colors.black,fontSize: 18),),
                        SizedBox(width: size.width*0.1,),
                        Icon(Icons.arrow_upward,color: Colors.black,),
                      ],
                    ),
                    onPressed: (){
                      showbottomsheet(context);
                      }
                  ),
              )
          ],
        ),
      ),
    );
  }
}
