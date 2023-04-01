import 'package:flutter/material.dart';

class DoubleDropdownMenu extends StatefulWidget {
  @override
  _DoubleDropdownMenuState createState() => _DoubleDropdownMenuState();
}

class _DoubleDropdownMenuState extends State<DoubleDropdownMenu> {
  String selectedNumber = '9';
  String selectedLetter = 'A';

  final List<String> numbers = ['9', '10', '11', '12'];
  final List<String> letters = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: selectedNumber,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedNumber = newValue;
              });
            }
          },
          items: numbers.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(width: 16.0),
        DropdownButton<String>(
          value: selectedLetter,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedLetter = newValue;
              });
            }
          },
          items: letters.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
