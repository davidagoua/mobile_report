import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_report/app/controllers/auth_controller.dart';
import 'package:mobile_report/app/data/hclient_provider.dart';

class HomeController extends GetxController {


  final auth = Get.find<AuthController>();
  final projects = [].obs;
  final isSyncronizing = false.obs;
  final hclient = Get.find<HclientProvider>();

  @override
  void onInit()async {
    super.onInit();

    print("print get projects");
    await setupProjects();

    print("token"+( await auth.getToken() ?? "no token"));
    await auth.getCurrentUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future setupProjects() async {




    try{
      print("Authorization token ${auth.getToken()}");
      final response = await hclient.client.get("https://traceagri.com/fr/api/projects/");
      if(response.statusCode == 200){
        print(response.data);
        print(response.data.toString());
        projects.value = response.data;
        // print(" countries ${countries.value}");
      }
    }catch(e){
      print("Erreur lors de la récupération des projets: $e");
    }
  }

}
