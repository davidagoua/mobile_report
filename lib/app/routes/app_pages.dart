import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/producteurForm/bindings/producteur_form_binding.dart';
import '../modules/producteurForm/views/producteur_form_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTEUR_FORM,
      page: () => const ProducteurFormView(),
      binding: ProducteurFormBinding(),
    ),
  ];
}
