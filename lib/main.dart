import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/routes/name_routes.dart';

import 'config/routes/mymiddleware.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginView,
      getPages: appRoutes(),
    );
  }
}
