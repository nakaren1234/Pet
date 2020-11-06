import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/userprofile_model.dart';

class ShowDetailUser extends StatefulWidget {
  ShowDetailUser({Key key}) : super(key: key);

  @override
  _ShowDetailUserState createState() => _ShowDetailUserState();
}

class _ShowDetailUserState extends State<ShowDetailUser> {
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

        UserprofileModel userprofileModel =
            UserprofileModel.fromMap(snapshot.data);
        setState(() {
          userprofileModels.add(userprofileModel);
        });
      }
    });
  }

  Widget showName(int index) {
    final user = userprofileModels[index];
    return Text(user.name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: userprofileModels.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return ListTile(
            title: Text(userprofileModels[index].name),
          );
        },
      ),
    );
  }
}
