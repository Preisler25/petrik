import 'package:flutter/material.dart';

void main() => runApp(const PetrikApp());

class PetrikApp extends StatelessWidget {
  const PetrikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Petrik App',
      home: const Scaffold(),
    );
  }
}

class RoorPage extends StatefulWidget {
  const RoorPage({super.key});

  @override
  State<RoorPage> createState() => _RoorPageState();
}

class _RoorPageState extends State<RoorPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
