import 'dart:convert';

import 'package:petrik/util/postInner.dart';
import 'package:http/http.dart' as http;

import '../const/appConst.dart';

//this class is used to store the posts array from the fetched json object

class JsonPostList {
  final List<PostInner> posts;

  JsonPostList({
    required this.posts,
  });

  //this method will be used to create a JsonPostList object from a json object
  factory JsonPostList.fromJson(Map<String, dynamic> parsedJson) {
    //we are creating a list of postsInners from the json object
    List<PostInner> posts = <PostInner>[];
    //we are iterating through the posts array in the json object and adding them to the posts list
    posts = parsedJson['posts']
        .map<PostInner>((json) => PostInner.fromJson(json))
        .toList();

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
Future<JsonPostList> fetchPostListInner() async {
  //the responese will be a json object which has a property called posts, which is an array of posts
  //{posts: [{id: 1, title: "title1", description: "description1", img_url: "url1"}, {id: 2, title: "title2", description: "description2", img_url: "url2"}]
  final response = await http.get(Uri.parse(AppConstants.API_IKSZ));
  //now we are testing if the response is ok
  if (response.statusCode == 200) {
    //now we are creating a JsonPostList object from the response body, this is done by the JsonPostList.fromJson method
    return JsonPostList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load posts');
  }
}
