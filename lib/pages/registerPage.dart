import 'package:flutter/material.dart';
import 'package:petrik/components/button.dart';
import 'package:petrik/components/textfield.dart';
import 'package:petrik/components/dropdown.dart';
import 'package:petrik/util/serverObj.dart';

import '../components/dialog.dart';
import '../user/profile.dart';
import '../util/serverFunc.dart';
import '../util/serverMessage.dart';
import 'mainPage.dart';

//   /\_/\
//  ( o o )
// ==( ^ )==
//  \~(*)~/

class RegisterForm extends StatefulWidget {
  final Function()? onTap;
  const RegisterForm({super.key, required this.onTap});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //controllerek
  final fullnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();
  final emailController = TextEditingController();
  final osztalyController = TextEditingController();

  // sign up funkció
  void signUserUp(BuildContext context) async {
    String name = usernameController.text.trim();
    String password = passwordController.text.trim();
    String password2 = password2Controller.text.trim();
    String email = emailController.text.trim();
    String osztaly = osztalyController.text.trim();

    print('alma');
    print('name: $name, password: $password, email: $email, osztaly: $osztaly');

    setState(() {
      isLoading = true;
    });

    //Máté a regUser az nem status hanem message ==> petrik/lib/util/user.dart  ugyan ugy van a message nek is status paramétere message.status, de egyedül a loginnél küldünk vissza status status amit lehet most fixelek mert ezt igy le írva érzem hogy szar <3

    print('name: $name, password: $password, email: $email, osztaly: $osztaly');

    ServerValidation status = await regUser(
      name,
      password,
      email,
      osztaly,
    );
    print(status);
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
                    /* const Icon(
                      Icons.person_pin,
                      size: 80,
                      color: Color.fromARGB(255, 41, 172, 124),
                    ), */
                    const SizedBox(height: 10),
                    //legyen szép napod:)
                    Text(
                      'Fiók létrehozása',
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    //fullname textfield
                    A_TextField(
                      controller: fullnameController,
                      hintText: 'Teljes név',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
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
                      controller: password2Controller,
                      hintText: 'Jelszó megerősítése',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    A_TextField(
                      controller: emailController,
                      hintText: 'E-mail cím',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    //ide kell a drowdown
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
                    const SizedBox(height: 30),
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
