import 'package:get/get.dart';

import '../models/parcelle_model.dart';

class ParcelleProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Parcelle.fromJson(map);
      if (map is List)
        return map.map((item) => Parcelle.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Parcelle?> getParcelle(int id) async {
    final response = await get('parcelle/$id');
    return response.body;
  }

  Future<Response<Parcelle>> postParcelle(Parcelle parcelle) async =>
      await post('parcelle', parcelle);
  Future<Response> deleteParcelle(int id) async => await delete('parcelle/$id');
}
