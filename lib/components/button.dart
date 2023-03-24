import 'package:flutter/material.dart';

class A_Button extends StatelessWidget {
  final Function()? onTap;

  const A_Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 41, 172, 124),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Bejelentkezés",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
