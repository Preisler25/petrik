import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:petrik/util/serverFunc.dart';

import '../../user/profile.dart';
import '../../user/user.dart';
import '../serverMessage.dart';

class PostInner {
  final int id;
  final int free_spaces;
  final String title;
  final String description;
  final String? imageURL;

  const PostInner({
    required this.id,
    required this.free_spaces,
    required this.title,
    required this.description,
    this.imageURL,
  });

  //this will crate a post object from a json object
  factory PostInner.fromJson(Map<dynamic, dynamic> json) {
    return PostInner(
      id: json['id'],
      free_spaces: json['free_spaces'],
      title: json['title'],
      description: json['description'],
      imageURL: json['img_url'],
    );
  }

  //to print the Post object
  @override
  String toString() {
    return 'id: $id, title: $title, free_space: $free_spaces description: $description, image: $imageURL';
  }

  //view of the post
  Widget build(BuildContext context) {
    double.infinity;
    return SizedBox(
      width: 200,
      height: 200,
      child: OpenContainer(
        closedElevation: 10,
        closedColor: Colors.transparent,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        closedBuilder: (context, action) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  blurRadius: 8,
                  offset: Offset(10, 10), // Shadow position
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.orange,
                  Colors.yellow,
                  Colors.orangeAccent,
                  Colors.deepOrange
                ],
              ),
            ),
            child: Align(
              //--
              //this is the closed container
              //--
              alignment: const Alignment(0.0, 0.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
        openBuilder: (context, action) {
          //--
          //this is the open container
          //--
          return Container(
            color: const Color.fromARGB(255, 103, 255, 212),
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, -0.8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: Text(description),
                ),
                Align(
                  alignment: const Alignment(0, -0.3),
                  child: Text('Free spaces: $free_spaces'),
                ),
                Align(
                  alignment: const Alignment(0, -0.4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      User user = getUser();
                      Future<Message> message = joinIksz(user, title);
                      message.then((value) {
                        if (value.status == true) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Sikeres csatlakozás!'),
                                content: Text(value.message),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: Text(value.message),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    },
                    child: const Text(
                      'Join',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.0, 0.9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: NetworkImage('$imageURL'),
                      width: 200,
                    ),
                  ),
                ),
                Align(
                  //--
                  //this is the close button
                  //--
                  alignment: const Alignment(0.9, -0.9),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'X',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
