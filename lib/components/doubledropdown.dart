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
    return Theme(
      data: ThemeData(
        canvasColor: Colors.grey[100], // set background color of dropdown menu
        primaryColor: Colors.blue, // set the primary color
        textTheme: TextTheme(
          titleSmall: TextStyle(
            color: Colors.grey[700], // set the color of the dropdown text
            fontSize: 18.0, // set the font size of the dropdown text
            fontWeight:
                FontWeight.w500, // set the font weight of the dropdown text
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Osztály:",
            style: TextStyle(
              color: Colors.grey[700], // set the color of the text
              fontSize: 18.0, // set the font size of the text
              fontWeight: FontWeight.w500, // set the font weight of the text
            ),
          ),
          SizedBox(width: 16.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white, // set background color of the container
              borderRadius: BorderRadius.circular(
                  10.0), // round the edges of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // set the shadow color
                  spreadRadius: 2.0, // set the spread radius of the shadow
                  blurRadius: 5.0, // set the blur radius of the shadow
                  offset: Offset(0, 3), // set the offset of the shadow
                ),
              ],
            ),
            child: DropdownButton<String>(
              value: selectedNumber,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedNumber = newValue;
                  });
                }
              },
              underline: SizedBox
                  .shrink(), // remove the underline of the dropdown button
              icon: Icon(Icons.arrow_drop_down), // set the dropdown icon
              iconSize: 28.0, // set the size of the dropdown icon
              items: numbers.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 16.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white, // set background color of the container
              borderRadius: BorderRadius.circular(
                  10.0), // round the edges of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // set the shadow color
                  spreadRadius: 2.0, // set the spread radius of the shadow
                  blurRadius: 5.0, // set the blur radius of the shadow
                  offset: Offset(0, 3), // set the offset of the shadow
                ),
              ],
            ),
            child: DropdownButton<String>(
              value: selectedLetter,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedLetter = newValue;
                  });
                }
              },
              underline: SizedBox
                  .shrink(), // remove the underline of the dropdown button
              icon: Icon(Icons.arrow_drop_down), // set the dropdown icon
              iconSize: 28.0, // set the size of the dropdown icon
              items: letters.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
