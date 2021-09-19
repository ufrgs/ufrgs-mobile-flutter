import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:ufrgs_mobile/models/api/login_response.dart';

part 'local_repository.g.dart';

@Injectable()
class LocalRepository extends Disposable {
  static const String _keyLoginData = 'loginData';

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyLoginData);
  }

  Future<void> saveLoginData(LoginData loginData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var string = json.encode(loginData.toJson());
    await prefs.setString(_keyLoginData, string);
  }

  Future<LoginData> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var s = prefs.getString(_keyLoginData);
    if (s == null) {
      throw Exception('No user logged in.');
    }

    var data = json.decode(s);

    return LoginData.fromJson(data);
  }

  Future<bool> removeLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_keyLoginData);
  }

  @override
  void dispose() {}
}
