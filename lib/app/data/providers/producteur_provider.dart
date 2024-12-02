import 'package:get/get.dart';

import '../models/producteur_model.dart';

class ProducteurProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Producteur.fromJson(map);
      if (map is List)
        return map.map((item) => Producteur.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://traceagri.com/fr/api/';
  }

  Future<Producteur?> getProducteur(int id) async {
    final response = await get('https://traceagri.com/fr/api/producteursmobile/$id');
    return response.body;
  }

  Future<Response<Producteur>> postProducteur(Producteur producteur) async =>
      await post('https://traceagri.com/fr/api/producteursmobile', producteur);

  Future<Response> deleteProducteur(int id) async =>
      await delete('https://traceagri.com/fr/api/producteursmobile/$id');
}
