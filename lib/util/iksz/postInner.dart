import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:petrik/util/serverFunc.dart';

import '../../user/profile.dart';
import '../../user/user.dart';
import '../serverMessage.dart';

class PostInner {
  final String id;
  final String title;
  final String description;
  String? imageURL;

  PostInner({
    required this.id,
    required this.title,
    required this.description,
    this.imageURL,
  });

  //this will crate a post object from a json object
  factory PostInner.fromJson(Map<dynamic, dynamic> json) {
    return PostInner(
      id: json['id'],
      title: json['name'],
      description: json['descript'],
      imageURL: json['imgUrl'],
    );
  }

  //to print the Post object
  @override
  String toString() {
    return 'id: $id, title: $title, description: $description, image: $imageURL';
  }

  //view of the post
  Widget build(BuildContext context) {
    double.infinity;
    if (imageURL == "") {
      print("körte");
      imageURL =
          "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
    }
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
            decoration: const BoxDecoration(
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
            decoration: const BoxDecoration(
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
            child: Stack(
              children: [
                Align(
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 400,
                  child: Stack(
                    children: [
                      Container(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        child: Container(
                          child: Text(
                            description,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          imageURL!,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Align(
                    alignment: const Alignment(0.0, 0.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
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
                                  title: const Text("Sikeres csatlakozás!"),
                                  content: const Text(
                                      "Sikeresen csatlakoztál az ikszhez!"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("OK"),
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
                                  title: const Text("Sikertelen csatlakozás!"),
                                  content: const Text(
                                      "Sikertelen csatlakozás az ikszhez!"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      },
                      child: const Text(
                        'Csatlakozás',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


/*ElevatedButton(
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
                  

                  Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
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
                  
                  
                  */