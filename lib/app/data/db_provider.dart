import 'dart:io';

import 'package:get/get.dart';
import 'package:mobile_report/app/data/models/parcelle_model.dart';
import 'package:mobile_report/app/data/models/producteur_model.dart';
import 'package:mobile_report/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';


class DbProvider extends GetConnect {

  Store? client;
  Box<Producteur>? producteurBox;
  Box<Parcelle>? parcelleBox;

  @override
  void onInit() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    client = await  Store(getObjectBoxModel(), directory: appDocDirectory.path + '/dir');
    producteurBox = await Box<Producteur>(client!);
  }

  Future<void> insertProducteur(Producteur producteur) async {
    await producteurBox!.put(producteur);
  }

  List<Producteur> getProducteurs() {
    return producteurBox!.getAll();
  }

  Future<void> insertParcelle(Parcelle parcelle) async {
    await parcelleBox!.put(parcelle);
  }

  List<Parcelle> getParcelle(int producteur_id, int projet_id){
    var q = parcelleBox.query(Parcelle_.producteur.equals(producteur_id) & Parcelle_.projet.equals(projet_id))
      .build();
    return q.find();
  }
}
