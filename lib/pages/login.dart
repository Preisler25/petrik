import 'package:flutter/material.dart';
import 'package:petrik/components/button.dart';
import 'package:petrik/components/textfield.dart';
import 'package:petrik/util/user.dart';

import '../util/status.dart';

//MÁTÉNAK note: a login gombra létre hozzól egy User(name, password) objektumot, majd a User osztályban lévő checkUser() metódusával elküldi a szervernek, a szerver pedig visszaküldi a választ, amit a login gombra létrehozott User objektum checkUser() metódusával fogadunk el.

//   /\_/\
//  ( o o )
// ==( ^ )==
//  \~(*)~/

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  //controllerek
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in funkció (még nincs implementálva)
  void signUserIn(BuildContext context) async {
    String name = usernameController.text;
    String password = passwordController.text;
    User user = User(name: name, password: password);
    Status status = await user.checkUser(name, password);
    if (status.status == "success") {
      //Navigálás a home oldalra, ha a bejelentkezés sikeres
      Navigator.pushNamed(context, "/home");
    } else {
      // Ha a bejelentkezés sikertelen, akkor egy alert dialog jelenik meg
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Sikertelen bejelentkezés"),
          content: Text("Hibás felhasználónév vagy jelszó"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.person_pin,
                  size: 100,
                  color: Color.fromARGB(255, 41, 172, 124),
                ),

                const SizedBox(height: 10),

                //legyen szép napod:)
                Text(
                  'Legyen Szép Napod!',
                  style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                // username textfield
                A_TextField(
                  controller: usernameController,
                  hintText: 'Felhasználónév',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                A_TextField(
                  controller: passwordController,
                  hintText: 'Jelszó',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Elfelejtett jelszó?',
                        style: TextStyle(color: Colors.grey[100]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                A_Button(
                  onTap: () => signUserIn(context),
                ),

                const SizedBox(height: 50),

                //regisztralj most
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nincs fiókod?',
                      style: TextStyle(
                        color: Colors.grey[100],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Regisztrálj most!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
