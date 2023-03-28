import 'package:flutter/material.dart';

class A_Dialog extends StatelessWidget {
  final String title;
  final String content;
  final Function onPressed;
  final IconData? icon;

  const A_Dialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      content: Text(
        content,
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
            onPressed: () => onPressed(),
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
    );
  }
}
