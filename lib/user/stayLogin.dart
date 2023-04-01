import 'package:shared_preferences/shared_preferences.dart';

void saveLogin(String name, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('stayLogin', true);
  prefs.setString('name', name);
  prefs.setString('password', password);
}

Future<Map<String, String>>? isLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool stayLogin = prefs.getBool('stayLogin') ?? false;
  if (stayLogin) {
    String name = prefs.getString('name') ?? '';
    String password = prefs.getString('password') ?? '';
    return {name: name, password: password};
  }
  return {};
}

void deleteLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('stayLogin', false);
  prefs.setString('name', '');
  prefs.setString('password', '');
}
