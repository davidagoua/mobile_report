import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:location/location.dart';


class ParcelleFormController extends GetxController {
  
  final formKey = GlobalKey<FormState>();

  final code = TextEditingController();
  final nom = TextEditingController();
  final status = TextEditingController();
  final affectations = TextEditingController();
  final cultures = [].obs;
  final carracteristic = TextEditingController();
  // LocationData? locationData;
  XFile? image;
  


  
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

  void pickImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  void getLocation() async {
    /*
    Location location = new Location();

    // get permissions
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;


    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    print("Location: $locationData");

     */
  }

  void validerEtEnvoyer() {
    if (formKey.currentState?.validate() ?? false) {
      print("Validation du formulaire");
    } else {
      print("Le formulaire n'est pas valide");
    }
  }
}
