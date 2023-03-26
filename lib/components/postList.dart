import 'package:flutter/material.dart';
import 'package:petrik/util/iksz/postInner.dart';

//this is just a visualizator for the postInner list which is fetched from the api (in the JsonPostList class)

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
