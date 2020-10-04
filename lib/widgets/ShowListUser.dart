// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/userprofile_model.dart';

class ShowListUser extends StatefulWidget {
  ShowListUser({Key key}) : super(key: key);

  @override
  _ShowListUserState createState() => _ShowListUserState();
}

class _ShowListUserState extends State<ShowListUser> {
  // Field
  List<UserprofileModel> userprofileModels = List();

  // Method

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    // FirestoreFirestore firestore = FirestoreFirestore.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference =
        firestore.collection('Userprofile');
    // ignore: await_only_futures
    await collectionReference.snapshots().listen((response) {
      // ignore: deprecated_member_use
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        print('snapshot = $snapshot');
        print('Name = ${snapshot.data['Name']}');
        // print(" = ${snapshot.data['Detail']}");
        // print('Name = ${snapshot.data['Name']}');

        UserprofileModel userprofileModel =
            UserprofileModel.fromMap(snapshot.data);
        setState(() {
          userprofileModels.add(userprofileModel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: userprofileModels.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return Text(userprofileModels[index].name);
        },
      ),
    );
  }
}
