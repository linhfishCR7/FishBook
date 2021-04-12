// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final usersRef = Firestore.instance.collection("users");

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    //getUserById();
    //createUser();
    // updateUser();
    deleteUser();
    super.initState();
  }

  createUser() {
    usersRef
        .document("asagfgag")
        .setData({"username": "Boi", "postCount": 0, "isAdmin": false});
  }

  updateUser() async {
    final doc = await usersRef.document("HbEWS7BMUDdUvEHtIYCL").get();
    if (doc.exists) {
      doc.reference
          .updateData({"username": "Nhu", "postCount": 1, "isAdmin": true});
    }
    //.updateData({"username": "Nhu", "postCount": 1, "isAdmin": true});
  }

  deleteUser() async {
    final DocumentSnapshot doc = await usersRef.document("HbEWS7BMUDdUvEHtIYCL").get();
    if (doc.exists) {
      doc.reference.delete();
    }
  }

  // getUserById() async {
  //   final String id = "HbEWS7BMUDdUvEHtIYCL";
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //     print(doc.data);
  //     print(doc.documentID);
  //     print(doc.exists);
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          } else {
            final List<Text> children = snapshot.data.documents
                .map((doc) => Text(doc['username'] ?? 'default'))
                .toList();
            return Container(
              child: ListView(
                children: children,
              ),
            );
          }
        },
      ),
      // body: Container(
      //   child: ListView(
      //     children:
      //         users.map((user) => Text(user['username'] ?? 'default')).toList(),
      //   ),
      // ),
    );
  }
}
