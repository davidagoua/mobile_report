import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProducteurFormController extends GetxController {


  final formKey = GlobalKey<FormState>();

  final nom_controller = TextEditingController();
  final prenoms_controller = TextEditingController();
  final sexe_controller = ''.obs;
  final telephone_controller = TextEditingController();
  final date_naissance_controller = TextEditingController();
  final lieu_naissance_controller = TextEditingController();
  final phot_controller = TextEditingController();
  final cooperative_controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
