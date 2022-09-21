import 'package:get/get.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/modules/features/detail_menu/view/ui/detail_menu_view.dart';
import 'package:train_venturo/modules/features/login/view/ui/login_view.dart';
import 'package:train_venturo/modules/features/order/view/ui/order_view.dart';

import '../../modules/features/detail_menu/controllers/detail_menu_controller.dart';
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
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.detailMenuView,
        page: () => const DetailMenuView(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(() {
          Get.put(DetailMenuController());
        }),
      ),
      GetPage(
        name: AppRoutes.orderView,
        page: () => const OrderView(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
