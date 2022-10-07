import 'package:flutter/material.dart';
import 'package:train_venturo/constant/common/media_query.dart';

class Background extends StatelessWidget {
  final Widget child;
  final double top;
  const Background({
    Key? key,
    required this.child,
    required this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSized(context),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "assets/images/bg_pattern.png",
              scale: 1.1,
            ),
          ),
          Positioned(
            top: top,
            child: child,
          ),
        ],
      ),
    );
  }
}
