import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.height * 0.01),
        elevation: 5.0,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(horizontal: size.width*0.04,vertical: size.height*0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("order id"),
                  Text("#578448"),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("order list"),Text("3 items"),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("total bill"),Text("5054"),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("states"),Text("ongoing",style: TextStyle(backgroundColor: Colors.blue,color: Colors.white),),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data"),Text("10/15/2022"),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Container(
                width: size.width,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                        Provider.of<OrderStateManager>(context,listen: false).setstatcontent(false);
                        Provider.of<OrderStateManager>(context,listen: false).setOrderdetail(true);
                      },
                      child: Text("عرض تفاصيل الطلب",style:TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: (){
                        Provider.of<OrderStateManager>(context,listen: false).setstatcontent(true);
                        Provider.of<OrderStateManager>(context,listen: false).setOrderdetail(true);
                      },
                      child: Text("تتبع الطلب",style:TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
