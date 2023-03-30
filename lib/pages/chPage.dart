import 'package:flutter/material.dart';

import '../util/helyettesites/helyettseitesListBuilder.dart';
import '../util/helyettesites/jsonHelyettesitesList.dart';
import '../util/serverFunc.dart';

class ChPage extends StatelessWidget {
  const ChPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<JsonHelyettesitesList> futurePostList =
        fetchHelyettesitesList();
    return Container(
      color: Colors.black,
      child: Center(
        child: FutureBuilder<JsonHelyettesitesList>(
          future: futurePostList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HelyettesitesList(items: snapshot.data!.helyettesites);
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
