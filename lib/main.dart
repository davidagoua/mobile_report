import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_report/app/data/db_provider.dart';
import 'package:mobile_report/app/data/hclient_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';
import 'app/controllers/auth_controller.dart';
import 'objectbox.g.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)
// The created directory is returned as a Future.
      .then((Directory directory) {
    print('Path of New Dir: '+directory.path);
  });
  final store = openStore(directory: appDocDirectory.path+'/'+'dir');

  final AuthController authmanager = Get.put(AuthController());
  Get.put(HclientProvider());
  final DbProvider db = Get.put(DbProvider());

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
      initialRoute: initialPage,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Colors.green[800]
      ),
    ),
  );
  store.close();
}
