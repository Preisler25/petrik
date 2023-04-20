import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petrik/util/helyettesites/jsonHelyettesitesList.dart';
import 'package:petrik/util/iksz/jsonPostList.dart';
import '../../const/appConst.dart';
import 'package:petrik/util/serverMessage.dart';
import 'package:flutter/material.dart';
import 'package:petrik/user/user.dart';
import 'package:petrik/util/serverObj.dart';

Future<JsonHelyettesitesList> fetchHelyettesitesList() async {
  final responser = await http.get(Uri.parse(AppConstants.API_HELYETTESITES));
  if (responser.statusCode == 200) {
    if (responser.body == "") {
      return JsonHelyettesitesList(helyettesites: []);
    }
    return JsonHelyettesitesList.fromJson(jsonDecode(responser.body));
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<JsonPostList> fetchPostListInner(User user) async {
  //the responese will be a json object which has a property called posts, which is an array of posts
  //{posts: [{id: 1, title: "title1", description: "description1", img_url: "url1"}, {id: 2, title: "title2", description: "description2", img_url: "url2"}]
  final response = await http.get(
    Uri.parse(AppConstants.API_IKSZ),
  );
  //now we are testing if the response is ok
  if (response.statusCode == 200) {
    print("-------------------------");
    print(response.body);
    print("-------------------------");
    //now we are creating a JsonPostList object from the response body, this is done by the JsonPostList.fromJson method
    return JsonPostList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<Message> joinIksz(User user, String title) async {
  final response = await http.get(
    Uri.parse(
        '${AppConstants.API_JOIN}?name=${user.name}&key=${user.key}&ik=$title'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    debugPrint(response.body);
    return Message.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 409) {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('User already exists');
  } else {
    throw Exception('Failed to register user');
  }
}

Future<ServerValidation> regUser(String name, String password, String email,
    String osztaly, String fullname) async {
  print(
      '--name: $name, password: $password, email: $email, osztaly: $osztaly, fullname: $fullname');

  final response = await http.get(Uri.parse(
      '${AppConstants.API_REG}?name=$name&password=$password&email=$email&osztaly=$osztaly&fullname=$fullname'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    debugPrint(response.body);
    return ServerValidation.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 409) {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('User already exists');
  } else {
    debugPrint(response.body);
    throw Exception('Failed to register user');
  }
}

Future<ServerValidation> checkUser(String name, String password) async {
  final response = await http.get(
      Uri.parse('${AppConstants.API_LOGIN}?name=$name&password=$password'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    debugPrint(response.body);

    return ServerValidation.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}
