import 'package:flutter/material.dart';
import 'package:petrik/util/helyettesites/helyettesitesInner.dart';

class HelyettesitesList extends StatelessWidget {
  final List<HelyetInner> items;

  const HelyettesitesList({super.key, required this.items});

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
