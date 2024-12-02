import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class CurrentUser {
  final String? username;
  final String? email;
  final int? id;


  CurrentUser({
    this.username,
    this.email,
    this.id
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      username: json['username'],
      email: json['email'],
    );
  }
}


class AuthController extends GetxController {
  final isLogged = false.obs;
  final token = "".obs;
  final box = GetStorage();
  final current_user = CurrentUser().obs;


  getCurrentUser() async {
    final client = Dio();
    final url = "https://traceagri.com/fr/auth/users/me";
    try{
      final response = await client.get(url, options: Options(headers: {
        "Authorization": "token ${token}"
      }));
      current_user.value = CurrentUser.fromJson(response.data);
      print("current user"+current_user.value.username!);
    }catch(e){
      print("Erreur lors de la récupération de l'utilisateur courant: $e");
    }

  }

  void logout() {
    isLogged.value = false;
    removeToken();
  }

  void login(String ontoken) async {
    token.value = ontoken;
    isLogged.value = true;
    //Token is cached
    await saveToken(ontoken);
  }

  void checkLoginStatus() {
    final ontoken = getToken() ?? token.value;
    if (ontoken != null) {
      isLogged.value = true;
    }
  }

  Future<void> removeToken() async {
    box.erase();
  }

  String? getToken(){
    return box.read('token') == null || box.read('token') == ''  ? box.read<String>('token') : token.value;
  }

  Future<void> saveToken(String? token) async {
    box.write('token', token!);
  }

  bool isOnBoard() {
    print("isOnBoard: ${box.read("isOnBoard")}" );
    return box.read("isOnBoard") ?? false;
  }
}