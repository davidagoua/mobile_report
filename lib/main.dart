import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/controllers/auth_controller.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  GetStorage.init();
  final AuthController authmanager = Get.put(AuthController());

  String initialPage = AppPages.INITIAL;
  
  authmanager.checkLoginStatus();
  if(authmanager.isLogged()){
    initialPage = Routes.HOME;
  }else{
    initialPage = Routes.INDEX;
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Colors.green[800]
      ),
    ),
  );
}
