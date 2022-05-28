import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class progressDialog extends StatelessWidget {
  final String? mssage ;

  const progressDialog({ this.mssage}) ;

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitFadingCube(
                size: 40.0,
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.blueAccent :Colors.grey,
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Text(mssage!,style: TextStyle(color: Colors.black,fontSize: 15.0),
              ),
            ],
          ),
    );
  }
}
