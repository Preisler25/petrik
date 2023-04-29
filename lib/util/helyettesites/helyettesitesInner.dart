//https://helyettesites.petrik.hu/api/?status=napihely
//[{"tname":"Bagóné Tóth Katalin","ora":"1.óra","helytan":"Csirmaz Antal","terem":"A.007 - Kémiai-alapozó labor I.","class":"9.A","ovh":"0","day":"2023.03.30"},{"tname":"Béresné Bodó Noémi Klementina","ora":"2.óra","helytan":"Budaházi Bence Nándor","terem":"A.007 - Kémiai-alapozó labor I.","class":"9.D","ovh":"0","day":"2023.03.30"}]

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class HelyetInner {
  final String t_name;
  final String ora;
  final String helytan_name;
  final String terem;

  const HelyetInner({
    required this.t_name,
    required this.ora,
    required this.helytan_name,
    required this.terem,
  });

  //this will crate a post object from a json object
  factory HelyetInner.fromJson(Map<dynamic, dynamic> json) {
    return HelyetInner(
      t_name: json['tname'],
      ora: json['ora'],
      helytan_name: json['helytan'],
      terem: json['terem'],
    );
  }

  //to print the Post object
  @override
  String toString() {
    return 't_name: $t_name, ora: $ora, helytan_name: $helytan_name, terem: $terem';
  }

  //view of the post
  Widget build(BuildContext context) {
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
                  Colors.cyanAccent,
                  Colors.cyan,
                ],
              ),
            ),
            child: Align(
              //--
              //this is the closed container
              //--
              alignment: const Alignment(0.0, 0.0),
              child: ListView(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    t_name,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 36, 38, 40),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    ora,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 36, 38, 40),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    textAlign: TextAlign.center,
                    helytan_name,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 36, 38, 40),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    terem,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 36, 38, 40),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        openBuilder: (context, action) {
          //--
          //this is the open container
          //--
          return Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(194, 31, 213, 222)),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(top: 40, right: 10),
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
                Text(
                  t_name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(205, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ListView(
                      children: [
                        Text(
                          'Helyettesitő tanár: $helytan_name',
                          style: const TextStyle(
                            fontSize: 23.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Terem: $terem',
                          style: const TextStyle(
                            fontSize: 23.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
