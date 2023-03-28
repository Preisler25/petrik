import 'package:flutter/material.dart';
import 'package:petrik/util/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _handleLogout(BuildContext context) {
    // Here implement the logic to log out the user
    // For example, you could clear the user's session data, navigate
    // back to the login page, etc.
    Navigator.popUntil(context, ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Szia, {user.name}!',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () => _handleLogout(context),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'A te osztályod: {user.osztaly}',
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 32.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Center(
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
