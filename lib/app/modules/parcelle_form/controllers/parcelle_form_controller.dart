import 'package:get/get.dart';
import 'package:flutter/material.dart';


class ParcelleFormController extends GetxController {
  
  final formKey = GlobalKey<FormState>();

  final code = TextEditingController();
  final nom = TextEditingController();
  final status = TextEditingController();
  final affectations = TextEditingController();
  final cultures = [].obs;
  final carracteristic = TextEditingController();
  


  
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
