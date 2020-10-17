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

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            image: NetworkImage(userprofileModels[index].pathImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget showName(int index) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          userprofileModels[index].name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget showDetail(int index) {
    String string = userprofileModels[index].detail;
    if (string.length > 100) {
      string = string.substring(0, 99);
      string = '$string...';
    }

    return Text(
      string,
      style: TextStyle(
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      padding: EdgeInsets.only(right: 20.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          showName(index),
          showName(index),
          showName(index),
          showName(index),
          showName(index),
          showDetail(index),
        ],
      ),
    );
  }

  Widget showListView(int index) {
    return Row(
      children: [
        showImage(index),
        showText(index),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: userprofileModels.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return showListView(index);
        },
      ),
    );
  }
}
