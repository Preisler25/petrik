import 'package:flutter/material.dart';
import 'package:petrik/components/button.dart';
import 'package:petrik/components/textfield.dart';
import 'package:petrik/components/dialog.dart';
import 'package:petrik/pages/mainPage.dart';
import 'package:petrik/user/profile.dart';
import 'package:petrik/util/status.dart';
import 'package:petrik/util/serverFunc.dart';
import 'package:petrik/util/user.dart';

//   /\_/\
//  ( o o )
// ==( ^ )==
//  \~(*)~/

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //controllerek
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign up funkció
  void signUserUp(BuildContext context) async {
    String name = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Check if username is valid (not empty and the no special characters)
    /*   if (name.isEmpty || !name.contains(RegExp(r'^[a-zA-Z0-9]+$'))) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Username'),
          content: const Text(
            'A felhasználónév nem tartalmazhat speciális karaktereket.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    } */

    // Check if password is valid
    /*  if (password.isEmpty ||
        password.length < 6 ||
        !password.contains(RegExp(r'\d')) ||
        !password[0].toUpperCase().contains(RegExp(r'[A-Z]'))) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Password'),
          content: const Text(
            'A jelszónak legalább 6 karakter hosszúnak kell lennie,legalább egy számot és egy nagy kezdőbetűt kell tartalmaznia.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    } */

    setState(() {
      isLoading = true;
    });
    Status status = await regUser(name, password);
    setState(() {
      isLoading = false;
    });
    if (status.status == true) {
      setUser(status.user);

      //Navigálás a userpage oldalra, ha a bejelentkezés sikeres
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    } else {
      // Ha a bejelentkezés sikertelen, akkor egy alert dialog jelenik meg
      showDialog(
        context: context,
        builder: (context) => A_Dialog(
          title: "Sikertelen Bejelentkezés",
          content: "Hibás felhasználónév vagy jelszó",
          onPressed: () => Navigator.pop(context),
          icon: Icons.sentiment_dissatisfied,
        ),
      );
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    // logo
                    const Icon(
                      Icons.person_pin,
                      size: 50,
                      color: Color.fromARGB(255, 41, 172, 124),
                    ),
                    const SizedBox(height: 10),
                    //legyen szép napod:)
                    Text(
                      'Ideje regisztrálnod!',
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                    //confirm password textfield
                    A_TextField(
                      controller: passwordController,
                      hintText: 'Jelszó megerősítése',
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
                      text: "Regisztráció",
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        signUserUp(context);
                      },
                    ),
                    const SizedBox(height: 50),
                    //jelentkezz be
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Van már fiókod?',
                          style: TextStyle(
                            color: Colors.grey[100],
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Jelentkezz be!',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            isLoading
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
