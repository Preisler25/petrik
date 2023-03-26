import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petrik/pages/login.dart';
import 'package:petrik/util/jsonPostList.dart';
import 'package:petrik/components/postList.dart';

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
