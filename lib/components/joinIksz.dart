import 'package:flutter/material.dart';
import 'package:petrik/components/textfield.dart';
import 'package:petrik/util/serverFunc.dart';
import 'package:petrik/util/serverMessage.dart';

class EmailAlert extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;
  final String id;

  const EmailAlert({
    Key? key,
    required this.title,
    required this.content,
    required this.id,
    this.icon,
  }) : super(key: key);

  void regToIksz(String mail, String id) {
    Future<Message> message = joinIksz(mail, id);
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(height: 20),
          ],
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Text(
              content,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            A_TextField(
              controller: emailController,
              hintText: 'email',
              obscureText: false,
              prefixIcon: Icons.person,
            ),
          ],
        ),
      ),
      actions: [
        Container(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () => regToIksz(emailController.text.trim(), id),
            child: Text(
              "Jelentkezem",
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
      backgroundColor: Color.fromARGB(255, 0, 214, 210),
    );
  }
}
