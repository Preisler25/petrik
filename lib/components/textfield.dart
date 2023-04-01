import 'package:flutter/material.dart';

class A_TextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;

  const A_TextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16.0,
          color: Colors.grey[800],
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: Colors.grey[500]),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey[100],
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
