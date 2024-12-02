import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_report/app/controllers/auth_controller.dart';

class IndexController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final nom_controller = TextEditingController();
  final password_controller = TextEditingController();
  final auth = Get.find<AuthController>();
  final loading = false.obs;
  final error = "".obs;
  final showPassword = false.obs;


  validerEtEnvoyer() async {
    try {
      loading.value = true;
      if (formKey.currentState?.validate() ?? false) {
        final client = Dio();
        client.options = BaseOptions(receiveDataWhenStatusError: true);
        final response = await client.post("https://traceagri.com/fr/auth/tablette/token/login/", data: {
          "username": nom_controller.text,
          "password": password_controller.text
        });
        if(response.statusCode == 200){
          auth.login(response.data['auth_token']);
          Get.offAllNamed("/home");
        }else{
          error.value = response.data['detail'];
        }
        print(response.data);

      } else {
        error("Formulaire invalide");
      }
    } catch (e) {
      print("Erreur lors de la connexion: $e");
      error("Email ou mot de passe incorrect !");
    }finally{
      loading.value = false;
    }
  }

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
