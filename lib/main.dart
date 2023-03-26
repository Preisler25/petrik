import 'package:flutter/material.dart';
import 'package:petrik/pages/login.dart';
import 'package:petrik/pages/ikszPage.dart';
import 'package:petrik/pages/newsPage.dart';
import 'package:petrik/pages/orarendPage.dart';
import 'package:petrik/pages/chPage.dart';
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
  User userProf = User(name: '', osztaly: '');
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Page1(),
    const Page2(),
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
  const Page1({Key? key, user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewsPage();
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IkszPage();
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrarendPage();
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChPage();
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}
