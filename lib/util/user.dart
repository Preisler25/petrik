import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  final String name;
  final String password;

  const User({
    required this.name,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      password: json['password'],
    );
  }

  Future<http.Response> createUser(String name, String password) async {
    return http.post(
      Uri.parse('http://192.168.1.199/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'password': password,
      }),
    );
  }
}
