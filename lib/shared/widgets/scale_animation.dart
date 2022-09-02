import 'package:flutter/material.dart';

class ScaleAnimations extends StatefulWidget {
  final Widget child;
  const ScaleAnimations({Key? key, required this.child}) : super(key: key);

  @override
  State<ScaleAnimations> createState() => _ScaleAnimationsState();
}

class _ScaleAnimationsState extends State<ScaleAnimations>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    repeatOnce();
    super.initState();
  }

  void repeatOnce() async {
    await _controller.forward();
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.center,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
