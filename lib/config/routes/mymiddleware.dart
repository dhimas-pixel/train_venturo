import 'package:get/get.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/modules/features/login/view/ui/login_view.dart';

import '../../modules/features/home/ui/home_view.dart';
import '../../modules/features/location/view/ui/location_view.dart';

appRoutes() => [
      GetPage(
        name: AppRoutes.loginView,
        page: () => const LoginView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.locationView,
        page: () => const LocationView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.homeView,
        page: () => const HomeView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

// class MyMiddelware extends GetMiddleware {
// }
