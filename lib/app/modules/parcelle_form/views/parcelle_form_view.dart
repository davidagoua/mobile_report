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
                decoration: InputDecoration(labelText: 'Code'),
                controller: controller.code,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un code' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom'),
                controller: controller.nom,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un nom' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Statut'),
                controller: controller.status,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un statut' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Caractéristique'),
                controller: controller.carracteristic,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer une caractéristique' : null,
              ),
              // Ajoutez un champ pour la culture
              TextFormField(
                decoration: InputDecoration(labelText: 'Culture (séparées par des virgules)'),
                onSaved: (value) {
                  if (value != null) {
                    culture = value.split(',').map((e) => Culture(value: e.trim())).toList();
                  }
                },
                validator: (value) => value!.isEmpty ? 'Veuillez entrer une culture' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Affectations'),
                controller: controller.affectations,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer des affectations' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Images'),
                onSaved: (value) => images = value,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer des images' : null,
              ),
              
              TextFormField(
                decoration: InputDecoration(labelText: 'Localité'),
                onSaved: (value) => localite = value,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer une localité' : null,
              ),
              
              GFButton(
                size: GFSize.LARGE,
                blockButton: true,
                fullWidthButton: true,
                onPressed: () {
                  
                },
                child: Text('Soumettre'),
              ),
          ]),
        )
      ]),
    );
  }
}
