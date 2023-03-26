import 'dart:convert';
import 'dart:ffi';

import 'package:petrik/const/appConst.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petrik/util/status.dart';

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

  Future<Status> regUser() async {
    final response = await http.post(
      Uri.parse('${AppConstants.API_REGISTER}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      debugPrint(response.body);
      return Status.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to register user');
    }
  }

  Future<Status> checkUser() async {
    final response = await http.get(
        Uri.parse('${AppConstants.API_LOGIN}?name=$name&password=$password'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      debugPrint(response.body);
      return Status.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }

  @override
  String toString() {
    return 'name: $name, password: $password';
  }
}
