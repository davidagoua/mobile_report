import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  final box = GetStorage('auth');
  final current_user = CurrentUser().obs;



  getCurrentUser() async {
    final client = Dio();
    final url = "https://traceagri.com/fr/auth/users/me";
    try{
      final response = await client.get(url, options: Options(headers: {
        "Authorization": "token ${await getPrefToken()}"
      }));
      current_user.value = CurrentUser.fromJson(response.data);
      print("current user"+current_user.value.username!);
    }catch(e){
      print("Erreur lors de la récupération de l'utilisateur courant: $e");
    }

  }

  void logout() async {
    isLogged.value = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    removeToken();
  }

  void login(String ontoken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = ontoken;
    isLogged.value = true;
    //Token is cached
    await saveToken(ontoken);
    await prefs.setString('token', ontoken);
  }

  void checkLoginStatus() {
    final ontoken = getPrefToken() ;
    if (ontoken != null) {
      isLogged.value = true;
    }
  }

  Future<String> getPrefToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('token') ?? '';
    return value;
  }

  Future<void> removeToken() async {
    box.erase();
  }

  Future<String?> getToken() async{
    var result = await box.read('token') != null || box.read('token') != ''  ? box.read<String>('token') : token.value;
    print("------------ getToken: $result");
    return result;
  }

  Future<void> saveToken(String? token) async {
    box.write('token', token!);
  }

  bool isOnBoard() {
    print("isOnBoard: ${box.read("isOnBoard")}" );
    return box.read("isOnBoard") ?? false;
  }
}