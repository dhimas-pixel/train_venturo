import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:train_venturo/modules/features/home/ui/home_view.dart';
import 'package:train_venturo/modules/features/location/view/ui/location_view.dart';
import 'package:train_venturo/modules/features/login/controllers/login_controller.dart';
import 'package:train_venturo/modules/features/login/view/ui/login_view.dart';

import 'config/pages/name_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return RestartWidget(
      child: FutureBuilder(
        future: loginController.checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return Obx(
            () => OverlaySupport.global(
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                getPages: appRoutes(),
                home: loginController.isLogged.isTrue
                    ? const HomeView()
                    : const LoginView(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  final Widget child;
  const RestartWidget({Key? key, required this.child}) : super(key: key);

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
