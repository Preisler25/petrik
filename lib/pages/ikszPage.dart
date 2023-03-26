import 'package:flutter/material.dart';
import 'package:petrik/components/postList.dart';
import 'package:petrik/util/jsonPostList.dart';

class IkszPage extends StatelessWidget {
  const IkszPage({Key? key}) : super(key: key);
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
