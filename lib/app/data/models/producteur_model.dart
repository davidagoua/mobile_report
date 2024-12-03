import 'dart:io';

import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

enum Genre {
  HOMME,
  FEMME


}




@Entity()
class Producteur {

  @Id() int? id;

  String? nom;
  String? prenom;


  String? sexe;
  String? telephone;

  @Property(type: PropertyType.date)
  DateTime? dateNaissance;
  String? lieuNaissance;

  @Transient()
  File? photo;
  int? cooperative;
  int? projet;

  Producteur(
      {this.nom,
      this.prenom,
      this.sexe,
      this.telephone,
      this.dateNaissance,
      this.lieuNaissance,
      this.photo,
      this.cooperative,
      this.projet});

  Producteur.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    sexe = json['sexe'];
    telephone = json['telephone'];
    dateNaissance = json['date_naissance'];
    lieuNaissance = json['lieu_naissance'];
    photo = json['photo'];
    cooperative = json['cooperative'];
    projet = json['projet'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['sexe'] = 'M';
    data['telephone'] = telephone;
    data['date_naissance'] = (new DateFormat('YYYY-MM-DD')).format(dateNaissance!) ;
    data['lieu_naissance'] = lieuNaissance;
    data['photo'] = photo;
    data['cooperative'] = cooperative;
    data['projet'] = projet;
    return data;
  }
}
