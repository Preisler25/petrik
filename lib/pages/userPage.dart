import 'package:flutter/material.dart';
import 'package:petrik/util/user.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({Key? key, required this.user}) : super(key: key);

  void _handleLogout(BuildContext context) {
    // Here implement the logic to log out the user
    // For example, you could clear the user's session data, navigate
    // back to the login page, etc.
    Navigator.popUntil(context, ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${user.name}!',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your class is: ${user.osztaly}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
