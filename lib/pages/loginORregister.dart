import 'package:flutter/material.dart';

import 'loginPage.dart';
import 'registerPage.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const LoginForm(
        onTap: togglePages(),
      );
    } else {
      return const RegisterForm(
        onTap: togglePages(),
      );
    }
  }
}
