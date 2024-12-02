import 'package:get/get.dart';

import '../controllers/parcelle_form_controller.dart';

class ParcelleFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParcelleFormController>(
      () => ParcelleFormController(),
    );
  }
}
