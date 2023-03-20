import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

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
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petrik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Petrik news'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
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
              icon: Icon(Icons.person),
              label: 'Helyettesítés',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
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
      color: Colors.white10,
      child: Center(
        child: Text(
          'Page 1',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
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
    return Container(
      color: Colors.white10,
      child: Center(
          child: PostList(
        items: List<Post>.generate(
          1000,
          (i) => Post(
            title: "Item $i",
            discript:
                "Lorem adasdasdasdasdasdasdasdsadsadasdasdssddsadasdasdasdasdsadsadsdsdsadsdasdasdsadsadsdsdsdadsasadsadasdaasdsadasdsa",
          ),
        ),
      )),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Center(
        child: Text(
          'Page 3',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
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
      color: Colors.white10,
      child: Center(
        child: Text(
          'Page 4',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  final List<Post> items;

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

class Post extends StatelessWidget {
  String title;
  String discript;

  Post({super.key, required this.title, required this.discript});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: OpenContainer(
        closedElevation: 10,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        closedColor: const Color.fromARGB(255, 79, 218, 236),
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
            color: const Color.fromARGB(255, 79, 218, 236),
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
                  child: Text(discript),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
