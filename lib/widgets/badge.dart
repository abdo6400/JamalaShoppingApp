import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget? child;
  final String? value;
  final Color? color;

  Badge({
    @required this.child,
    @required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
     // overflow: Overflow.visible,flu
      children: [
        child!,
        Positioned(
          bottom: 10,
          right: 12,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                color: color != null ? color : Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10.0)),
            constraints: BoxConstraints(minHeight: 12, minWidth: 12),
            child: Text(
              value!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
