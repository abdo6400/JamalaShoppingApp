import 'dart:math';

import 'package:flutter/material.dart';


class HeroAnimation extends StatefulWidget {
  HeroAnimation({this.child});
  final Widget? child;
  @override
  _HeroAnimationState createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> with SingleTickerProviderStateMixin {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: '1',
        child: widget.child!
    );
  }
}
