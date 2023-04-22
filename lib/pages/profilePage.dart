import 'package:flutter/material.dart';
import 'package:petrik/user/user.dart';
import 'package:petrik/user/profile.dart';
import 'package:petrik/user/stayLogin.dart';
import 'package:petrik/pages/loginORregister.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _handleLogout(BuildContext context) {
    deleteLogin();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginOrRegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = getUser();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Szia, ${user.name}!',
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.logout),
                  onPressed: () => _handleLogout(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 32.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(66, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Ide majd jönnek a beállítások',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
