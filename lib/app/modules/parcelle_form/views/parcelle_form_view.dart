import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/parcelle_form_controller.dart';

class ParcelleFormView extends GetView<ParcelleFormController> {
  const ParcelleFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une parcelle'),
        
      ),
      body: VStack([
        Form(
          key: controller.formKey,
          child: VStack([
            TextFormField(
                decoration: getTFStyle('Code'),
                controller: controller.code,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un code' : null,
              ),
              TextFormField(
                decoration: getTFStyle('Nom'),
                controller: controller.nom,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un nom' : null,
              ),
              TextFormField(
                decoration: getTFStyle('Statut'),
                controller: controller.status,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un statut' : null,
              ),
              TextFormField(
                decoration: getTFStyle('Caractéristique'),
                controller: controller.carracteristic,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer une caractéristique' : null,
              ),
              // Ajoutez un champ pour la culture

              TextFormField(
                decoration: getTFStyle('Affectations'),
                controller: controller.affectations,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer des affectations' : null,
              ),
              HStack([
                GFButton(
                  color: Vx.green800,
                  onPressed: controller.pickImage,
                  child: "Prendre une photo".text.make(),
                ),
                GFButton(
                  color: Vx.green800,
                  onPressed: controller.getLocation,
                  child: "Obtenir la localisation".text.make(),
                ),
              ], alignment: MainAxisAlignment.spaceAround, spacing: 10,),
              
              GFButton(
                color: Vx.green800,
                size: GFSize.LARGE,
                blockButton: true,
                fullWidthButton: true,
                onPressed: () {
                  
                },
                child: Text('Soumettre'),
              ),
          ], spacing: 10,).p(15),
        )
      ]).scrollVertical(),
    );
  }

  InputDecoration getTFStyle(String label, {bool? isObscure = false}){
    return InputDecoration(
        label: "${label}".text.make(),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
    );
  }
}
