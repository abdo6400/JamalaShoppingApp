import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class NotifiactionListView extends StatelessWidget {
  const NotifiactionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.04, horizontal: size.width * 0.05),
        height: size.height,
        width: size.width,
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return NotificationItem(
              key: ValueKey(index),
              index: index + 1,
            );
          },
          itemCount: 4,
          separatorBuilder: (ctx, index) {
            return SizedBox(height: size.height*0.01,);
          },
        ));
  }
}
