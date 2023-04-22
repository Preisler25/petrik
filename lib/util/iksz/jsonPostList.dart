import 'package:petrik/util/iksz/postInner.dart';

//this class is used to store the posts array from the fetched json object

class JsonPostList {
  final List<PostInner> posts;

  JsonPostList({
    required this.posts,
  });

  //this method will be used to create a JsonPostList object from a json object
  factory JsonPostList.fromJson(List<dynamic> parsedJson) {
    //we are creating a list of postsInners from the json object
    List<PostInner> posts = <PostInner>[];
    //we are iterating through the posts array in the json object and adding them to the posts list
    posts =
        parsedJson.map<PostInner>((json) => PostInner.fromJson(json)).toList();

    return JsonPostList(
      posts: posts,
    );
  }

  @override
  String toString() {
    return 'posts: $posts';
  }
}

//this func is in charge of fetching the iksz posts for the iksz api page
