import 'package:shared_preferences/shared_preferences.dart';

void saveMail(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('savedEmail', true);
  prefs.setString('email', email);
}

Future<Map<String, String>> isSavedEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool savedEmail = prefs.getBool('savedEmail') ?? false;
  if (savedEmail) {
    String email = prefs.getString('email') ?? '';
    return {'email': email};
  }
  return {'email': ''};
}

void deleteMail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('savedEmail', false);
  prefs.setString('email', '');
}
