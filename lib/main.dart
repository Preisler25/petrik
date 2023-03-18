import 'package:flutter/material.dart';

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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Page2(),
    Page3(),
    Page4(),
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
          title: Text('Petrik news'),
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
          child: Post(
        items: List<ListItem>.generate(
          1000,
          (i) => ListItem("Item $i"),
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

class Post extends StatelessWidget {
  final List<ListItem> items;

  const Post({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: item.buildTitle(context),
        );
      },
    );
  }
}

class ListItem {
  final String title;

  ListItem(this.title);

  Widget buildTitle(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        TextButton(
            onPressed: () => debugPrint('TextButton pressed'),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Text('Alma'),
            )),
      ],
    );
  }
}
