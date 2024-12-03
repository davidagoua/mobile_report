import 'package:mobile_report/objectbox.g.dart';

@Entity()
class Parcelle {

  @Id() int? id;
  String? code;
  String? nom;
  String? status;
  List<String>? carracteristic;
  List<String>? culture;
  String? affectations;
  dynamic images;
  int? producteur;
  dynamic localite;
  int? projet;


  List<String>? culturePerenne;
  List<String>? cultureSaisonniere;

  Parcelle(
      {this.code,
      this.nom,
      this.status,
      this.carracteristic,
      this.culture,
      this.affectations,
      this.images,
      this.producteur,
      this.localite,
      this.projet,
      this.culturePerenne,
      this.cultureSaisonniere});

  Parcelle.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    nom = json['nom'];
    status = json['status'];
    carracteristic = json['carracteristic'];
    if (json['culture'] != null) {
      culture = <String>[];
      json['culture'].forEach((v) {
        culture?.add(v);
      });
    }
    affectations = json['affectations'];
    images = json['images'];
    producteur = json['producteur'];
    localite = json['localite'];
    projet = json['projet'];
    if (json['culture_perenne'] != null) {
      culturePerenne = <String>[];
      json['culture_perenne'].forEach((v) {
        culturePerenne?.add(v);
      });
    }
    if (json['culture_saisonniere'] != null) {
      cultureSaisonniere = <String>[];
      json['culture_saisonniere'].forEach((v) {
        cultureSaisonniere?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['nom'] = nom;
    data['status'] = status;
    data['carracteristic'] = carracteristic;
    if (culture != null) {
      data['culture'] = culture?.map((v) => v).toList();
    }
    data['affectations'] = affectations;
    data['images'] = images;
    data['producteur'] = producteur;
    data['localite'] = localite;
    data['projet'] = projet;
    if (culturePerenne != null) {
      data['culture_perenne'] = culturePerenne?.map((v) => v).toList();
    }
    if (cultureSaisonniere != null) {
      data['culture_saisonniere'] =
          cultureSaisonniere?.map((v) => v).toList();
    }
    return data;
  }
}

class Culture {
  String? value;

  Culture({this.value});

  Culture.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    return data;
  }
}
