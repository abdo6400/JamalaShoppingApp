import 'package:flutter/material.dart';


class FadeAnimationPage extends StatefulWidget {
  FadeAnimationPage({this.child});
  final Widget? child;
  @override
  _FadeAnimationPageState createState() => _FadeAnimationPageState();
}

class _FadeAnimationPageState extends State<FadeAnimationPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: widget.child
    );
  }
}