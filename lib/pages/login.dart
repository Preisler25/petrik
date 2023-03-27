import 'package:flutter/material.dart';
import 'package:petrik/components/button.dart';
import 'package:petrik/components/textfield.dart';
import 'package:petrik/pages/userPage.dart';
import 'package:petrik/user/profile.dart';
import 'package:petrik/util/status.dart';
import 'package:petrik/util/logicLogReg.dart';

//MÁTÉNAK note: a login gombra létre hozzól egy User(name, password) objektumot, majd a User osztályban lévő checkUser() metódusával elküldi a szervernek, a szerver pedig visszaküldi a választ, amit a login gombra létrehozott User objektum checkUser() metódusával fogadunk el.

//   /\_/\
//  ( o o )
// ==( ^ )==
//  \~(*)~/

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //controllerek
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in funkció
  void signUserIn(BuildContext context) async {
    String name = usernameController.text;
    String password = passwordController.text;
    setState(() {
      isLoading = true;
    });
    Status status = await checkUser(name, password);
    setState(() {
      isLoading = false;
    });
    if (status.status == true) {
      setName(status.user!.name);
      setClass(status.user!.osztaly);
      //Navigálás a userpage oldalra, ha a bejelentkezés sikeres
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserPage(user: status.user!)),
      );
    } else {
      // Ha a bejelentkezés sikertelen, akkor egy alert dialog jelenik meg
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.white,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                "Sikertelen Bejelentkezés",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Text(
            "Hibás felhasználónév vagy jelszó",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Colors.black.withOpacity(0.12),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Color(0xFF00D68B),
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
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        signUserIn(context);
                      },
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
