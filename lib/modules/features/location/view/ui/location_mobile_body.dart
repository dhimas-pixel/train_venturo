import 'package:flutter/material.dart';
import 'package:train_venturo/modules/features/location/view/components/background.dart';

class LocationMobileBody extends StatelessWidget {
  const LocationMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Background(
          child: Text("Mobile"),
        ),
      ),
    );
  }
}
