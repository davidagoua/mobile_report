import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_report/app/data/models/producteur_model.dart';
import 'package:mobile_report/app/data/providers/producteur_provider.dart';
import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';

class ProducteurFormController extends GetxController {


  final formKey = GlobalKey<FormState>();

  final nom_controller = TextEditingController();
  final prenoms_controller = TextEditingController();
  final Rx<Genre?> sexe_controller = Genre.HOMME.obs;
  final telephone_controller = TextEditingController();
  final date_naissance_controller = TextEditingController();
  final lieu_naissance_controller = TextEditingController();
  final RxList projects = [].obs;
  final RxList coops = [].obs;
  //Rx<XFile?>? photo;

  final cooperative_controller = TextEditingController();


  void validerEtEnvoyer() async {
        if (formKey.currentState?.validate() ?? false) {
            final producteur = Producteur(
                nom: nom_controller.text,
                prenom: prenoms_controller.text,
                sexe: sexe_controller.value,
                telephone: telephone_controller.text,
                dateNaissance: DateTime.parse(date_naissance_controller.text), // Assurez-vous que le format est correct
                lieuNaissance: lieu_naissance_controller.text,
                cooperative: int.tryParse(cooperative_controller.text), // Assurez-vous que c'est un entier
            );

            final provider = ProducteurProvider();
            final response = await provider.postProducteur(producteur);

            if (response.isOk) {
                print("Producteur ajouté avec succès");
            } else {
                print("Erreur lors de l'ajout du producteur: ${response.statusText} ${response.request!.url}");
            }
        } else {
            // Gérer les erreurs de validation
            print("Le formulaire n'est pas valide");
        }
    }

  @override
  void onInit() async {
    super.onInit();
    await setupCoops();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pickImage() async{
    // final ImagePicker picker = ImagePicker();
    //photo!.value = await picker.pickImage(source: ImageSource.camera);
  }

  Future<void> setupProjects() async {
    final dio = Dio();
    final response = await dio.get("https://traceagri.com/fr/api/projects/");
    if(response.statusCode == 200){
      print(response.data);
      print(response.data.toString());
      projects.value = response.data;
      // print(" countries ${countries.value}");
    }
  }
  Future<void> setupCoops() async {
    final dio = Dio();
    final response = await dio.get("https://traceagri.com/fr/api/cooperatives/");
    if(response.statusCode == 200){
      print(response.data);
      print(response.data.toString());
      projects.value = response.data;
      // print(" countries ${countries.value}");
    }
  }

}
