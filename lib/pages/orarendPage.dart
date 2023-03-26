import 'package:flutter/material.dart';

class OrarendPage extends StatelessWidget {
  const OrarendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'Órarend Page',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
