import 'package:petrik/util/helyettesites/helyettesitesInner.dart';

class JsonHelyettesitesList {
  final List<HelyetInner> helyettesites;

  const JsonHelyettesitesList({
    required this.helyettesites,
  });

  factory JsonHelyettesitesList.fromJson(List<dynamic> parsedJson) {
    List<HelyetInner> helyettesites = <HelyetInner>[];
    print(parsedJson);
    helyettesites = parsedJson
        .map<HelyetInner>((json) => HelyetInner.fromJson(json))
        .toList();

    return JsonHelyettesitesList(
      helyettesites: helyettesites,
    );
  }

  @override
  String toString() {
    return 'helyettesites: $helyettesites';
  }
}

//this func is in charge of fetching the iksz posts for the iksz api page
