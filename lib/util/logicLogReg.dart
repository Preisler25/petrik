import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:petrik/util/status.dart';
import 'package:petrik/const/appConst.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

Future<Status> regUser(
    String name, String password, String email, String osztaly) async {
  final response = await http.post(
    Uri.parse('${AppConstants.API_REGISTER}?name=$name&password=$password'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'password': password,
      'email': email,
      'osztaly': osztaly,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    debugPrint(response.body);
    return Status.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 409) {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('User already exists');
  } else {
    throw Exception('Failed to register user');
  }
}

Future<Status> checkUser(String name, String password) async {
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
