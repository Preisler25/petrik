import 'package:flutter/material.dart';

void main() => runApp(const PetrikApp());

class PetrikApp extends StatelessWidget {
  const PetrikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petrik App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petrik news'),
      ),
      body: const Center(
        child: Text('Hello world'),
      ),
    );
  }
}
