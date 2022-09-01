import 'dart:async';

import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  final Widget child;
  const BounceAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation> {
  late double marginTop;

  void changePosition(Timer t) async {
    if (mounted) {
      setState(() {
        marginTop = marginTop == 0 ? 10 : 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    marginTop = 0;
    Timer.periodic(const Duration(milliseconds: 600), changePosition);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: widget.child,
    );
  }
}
