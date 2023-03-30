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
    double.infinity;
    return SizedBox(
      width: 200,
      height: 200,
      child: OpenContainer(
        closedElevation: 10,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        closedColor: const Color.fromARGB(255, 103, 255, 212),
        closedBuilder: (context, action) {
          return Align(
            //--
            //this is the closed container
            //--
            alignment: const Alignment(0.0, 0.0),
            child: Text(
              t_name,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
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
                    t_name,
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: Text(
                    ora,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
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
