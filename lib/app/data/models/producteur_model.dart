import 'dart:io';

enum Genre {HOMME,FEMME}





class Producteur {
  String? nom;
  String? prenom;
  Genre? sexe;
  String? telephone;
  DateTime? dateNaissance;
  String? lieuNaissance;
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
    data['sexe'] = sexe;
    data['telephone'] = telephone;
    data['date_naissance'] = dateNaissance;
    data['lieu_naissance'] = lieuNaissance;
    data['photo'] = photo;
    data['cooperative'] = cooperative;
    data['projet'] = projet;
    return data;
  }
}
