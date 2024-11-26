import 'package:get/get.dart';

import '../controllers/producteur_form_controller.dart';

class ProducteurFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProducteurFormController>(
      () => ProducteurFormController(),
    );
  }
}
