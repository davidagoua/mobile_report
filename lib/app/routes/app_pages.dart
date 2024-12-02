import 'package:get/get.dart';

import '../modules/detail_project/bindings/detail_project_binding.dart';
import '../modules/detail_project/views/detail_project_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/index/bindings/index_binding.dart';
import '../modules/index/views/index_view.dart';
import '../modules/parcelle_form/bindings/parcelle_form_binding.dart';
import '../modules/parcelle_form/views/parcelle_form_view.dart';
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
    GetPage(
      name: _Paths.INDEX,
      page: () => const IndexView(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PROJECT,
      page: () => const DetailProjectView(),
      binding: DetailProjectBinding(),
    ),
    GetPage(
      name: _Paths.PARCELLE_FORM,
      page: () => const ParcelleFormView(),
      binding: ParcelleFormBinding(),
    ),
  ];
}
