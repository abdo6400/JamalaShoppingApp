import 'package:flutter/material.dart';


class SlideTransitionAnimation extends StatefulWidget {
 SlideTransitionAnimation({this.child});
  final Widget? child;
  @override
  _SlideTransitionAnimationState createState() => _SlideTransitionAnimationState();
}

class _SlideTransitionAnimationState extends State<SlideTransitionAnimation> with SingleTickerProviderStateMixin {
 late AnimationController _controller;
 late  Animation<Offset> _animation; @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(1, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease ,
    ));
  }


  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation,
        transformHitTests: true,
        textDirection: TextDirection.ltr,
        child: widget.child
    );
  }
}
