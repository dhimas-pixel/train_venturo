import 'package:flutter/material.dart';

import '../../constant/common/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;

  const ResponsiveLayout(
      {Key? key, required this.mobileBody, required this.tabletBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else {
          return tabletBody;
        }
      },
    );
  }
}
