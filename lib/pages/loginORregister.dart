import 'package:flutter/material.dart';

import '../util/serverFunc.dart';
import '../util/serverMessage.dart';
import 'loginPage.dart';
import 'registerPage.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  Future<Message> message = regUser('admin', 'admin', 'email', '9/ky');

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginForm(
        onTap: togglePages,
      );
    } else {
      return RegisterForm(
        onTap: togglePages,
      );
    }
  }
}
