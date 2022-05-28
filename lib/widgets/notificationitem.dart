import 'package:flutter/material.dart';
import 'dart:math';

class NotificationItem extends StatelessWidget {
  final int? index;

  NotificationItem({Key? key, this.index}) : super(key: key);
  final Color color = Colors.primaries[Random().nextInt(17)];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dismissible(
      key: ValueKey(key),
      onDismissed: (direction) {},
      background: Icon(Icons.delete_forever),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white10,
              ),
              child: AlertDialog(
                title: Text("Alert Dialog Box"),
                content: Text("You have raised a Alert Dialog Box"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      "حسنا",
                      style: TextStyle(fontSize: 12, color: color),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: Card(
          elevation: 5.0,
          shadowColor: Colors.blue,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("the request has accept"),
                Icon(
                  Icons.notifications,
                  color: color,
                  size: size.height * 0.04,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
