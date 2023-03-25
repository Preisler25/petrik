import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:http/http.dart' as http;
import 'package:petrik/const/appConst.dart';
import 'package:petrik/pages/login.dart';
import 'package:petrik/util/status.dart';
import 'package:petrik/util/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Page1(),
    Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  static final List<String> _titleList = [
    'Petrik News',
    'IKSZ',
    'Órarend',
    'Helyettesít',
    'Fiók'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (mounted) {
      setState(() {
        AppBar(
          title: Text(_titleList[_selectedIndex]),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petrik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          selectedItemColor: Color.fromARGB(255, 103, 255, 212),
          unselectedItemColor: Color.fromARGB(112, 103, 255, 212),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_titleList[_selectedIndex]),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Hírek',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'IKSZ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Órarend',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_remove),
              label: 'Helyettesít',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Fiók',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'Page 1',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Future<JsonPostList> futurePostList = fetchPostListInner();
    return Container(
      color: Colors.black,
      child: Center(
        child: FutureBuilder<JsonPostList>(
          future: futurePostList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PostList(items: snapshot.data!.posts);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'Page 3',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'Page 4',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}

//Util

class PostList extends StatelessWidget {
  final List<PostInner> items;

  const PostList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: item.build(context),
        );
      },
    );
  }
}

//
//
//
//
//Api for post //
//
//

Future<JsonPostList> fetchPostListInner() async {
  final response = await http.get(Uri.parse(AppConstants.API_IKSZ));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    debugPrint(response.body);
    debugPrint(jsonDecode(response.body).toString());
    return JsonPostList.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class JsonPostList {
  final List<PostInner> posts;

  JsonPostList({
    required this.posts,
  });

  factory JsonPostList.fromJson(Map<String, dynamic> parsedJson) {
    List<PostInner> posts = <PostInner>[];
    debugPrint(parsedJson['posts'].toString());
    posts = parsedJson['posts']
        .map<PostInner>((json) => PostInner.fromJson(json))
        .toList();

    return JsonPostList(
      posts: posts,
    );
  }

  @override
  String toString() {
    return 'posts: $posts';
  }
}

class PostInner {
  final int id;
  final String title;
  final String description;
  final String? imageURL;

  const PostInner({
    required this.id,
    required this.title,
    required this.description,
    this.imageURL,
  });

  factory PostInner.fromJson(Map<String, dynamic> json) {
    return PostInner(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageURL: json['image'],
    );
  }

  @override
  String toString() {
    return 'id: $id, title: $title, description: $description, image: $imageURL';
  }

  Widget build(BuildContext context) {
    double.infinity;
    return SizedBox(
      width: 200,
      height: 200,
      child: OpenContainer(
        closedElevation: 10,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        closedColor: const Color.fromARGB(255, 103, 255, 212),
        closedBuilder: (context, action) {
          return Align(
            alignment: const Alignment(0.0, 0.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          );
        },
        openBuilder: (context, action) {
          return Container(
            color: const Color.fromARGB(255, 103, 255, 212),
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, -0.8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: Text(description),
                ),
                Align(
                  alignment: const Alignment(0.0, 0.9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: NetworkImage('$imageURL'),
                      width: 200,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.9, -0.9),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      //user creating itt van Matwe
                      User user1 =
                          const User(name: "name", password: "password");
                      Future<Status> data = user1.checkUser();
                      data.then((value) => print(value.status));
                    },
                    child: const Text(
                      'X',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
