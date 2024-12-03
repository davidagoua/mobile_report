import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_report/app/controllers/auth_controller.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HclientProvider extends GetConnect {

  Dio client = Dio();
  AuthController auth = Get.find<AuthController>();
  token()  async => await auth.getPrefToken();
  final box = GetStorage('auth');

  @override
  void onInit() async {

    client.options.baseUrl = 'https://traceagri.com/fr';
    client.options.headers['Authorization'] = 'token ${await token()}';
    client.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));;
  }
}
