import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void snackBar(BuildContext context, String message, double size) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.symmetric(horizontal: size),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.blueAccent,
  ));
}

void showDailog(BuildContext context, String Message) {
  AlertDialog alert = AlertDialog(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(
          width: 2
        )
      ),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCube(
              size: 40.0,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.blueAccent.shade700 : Colors.grey,
                  ),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
             Text(
                  Message,
                  textAlign: TextAlign.center,
                ),
          ],
        ),
      ));
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alert;
      });
}

void showDailog1(BuildContext context, String Message) {
  showDialog(
      context: context,
      builder: (ctx) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: AlertDialog(
            content: Text("$Message"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text(
                  "حسنا",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          )));
}
