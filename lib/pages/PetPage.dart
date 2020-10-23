// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/ShowDetailUser.dart';
// import 'package:flutterapp/widgets/ShowListUser.dart';
// import 'package:flutterapp/widgets/addListUser.dart';
// import 'package:flutterapp/models/userprofile_model.dart';

class PetPage extends StatefulWidget {
  PetPage({Key key}) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  //field
  // List<UserprofileModel> userprofileModels = List();

  Widget petWidget = ShowDetailUser();

  //method

  // @override
  // void initState() {
  //   super.initState();
  //   readAllData();
  // }

  // Future<void> readAllData() async {
  //   // FirestoreFirestore firestore = FirestoreFirestore.instance;
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   CollectionReference collectionReference =
  //       firestore.collection('Userprofile');
  //   // ignore: await_only_futures
  //   await collectionReference.snapshots().listen((response) {
  //     // ignore: deprecated_member_use
  //     List<DocumentSnapshot> snapshots = response.documents;
  //     for (var snapshot in snapshots) {
  //       print('snapshot = $snapshot');
  //       print('Name = ${snapshot.data['Name']}');
  //       // print(" = ${snapshot.data['Detail']}");
  //       // print('Name = ${snapshot.data['Name']}');

  //       UserprofileModel userprofileModel =
  //           UserprofileModel.fromMap(snapshot.data);
  //       setState(() {
  //         userprofileModels.add(userprofileModel);
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('ประวัติสัตว์เลี้ยง'),
        actions: [],
      ),
      body: petWidget,
    );
  }
}
