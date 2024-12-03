import 'package:get/get.dart';
import 'package:mobile_report/app/data/db_provider.dart';
import 'package:mobile_report/app/data/hclient_provider.dart';
import 'package:mobile_report/app/data/models/producteur_model.dart';

class DetailProjectController extends GetxController {

  Map<String, dynamic>? project = {};
  RxList<Producteur> producteurs = <Producteur>[].obs;

  final HclientProvider hclientProvider = Get.find<HclientProvider>();
  final DbProvider dbProvider = Get.find<DbProvider>();
  final isSync = false.obs;

  @override
  void onInit() {
    super.onInit();
    project = Get.arguments;
    producteurs.value = dbProvider.getProducteurs();
  }

  reloadProducteurs() {
    producteurs.value = dbProvider.getProducteurs();
  }

  sync() async {
    try{
      isSync.value = true;

      producteurs.forEach((producteur) async {

          final response = await hclientProvider.client.post("/api/producteursmobile/", data: producteur.toJson());
          if(response.statusCode == 200 || response.statusCode == 201){
            producteur.id = response.data['id'];
            dbProvider.producteurBox!.removeAll();
          }

      });

    }catch(e){
      print("Erreur lors de la synchronisation: $e");
    }finally{
      isSync.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    reloadProducteurs();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
