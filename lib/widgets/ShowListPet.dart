import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/petprofile_model.dart';

class ShowListPet extends StatefulWidget {
  ShowListPet({Key key}) : super(key: key);

  @override
  _ShowListPetState createState() => _ShowListPetState();
}

class _ShowListPetState extends State<ShowListPet> {
  //fild
  List<PetprofileModel> petprofileModels = List();
  //method

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference =
        firestore.collection('Petprofile');
    // ignore: await_only_futures
    await collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.docs;
      // ignore: unused_local_variable
      for (var snapshot in snapshots) {
        print('snapshot = $snapshot');
        print('Name = ${snapshot.data['Name']}');
        //การดึงค่าจากmodelมาformapsnapshot
        PetprofileModel petprofileModel =
            PetprofileModel.formMap(snapshot.data);
        //การดึงค่าออกมาโชว์
        setState(() {
          petprofileModels.add(petprofileModel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: petprofileModels.length,
        itemBuilder: (BuildContext buildContext, int index) =>
            buildcard(buildContext, index),
      ),
    );
  }

  Widget buildcard(BuildContext buildContext, int index) {
    final pet = petprofileModels[index];
    return new Container(
      child: Card(
        child: Column(
          children: [
            Text(pet.name),
            Text(pet.color),
          ],
        ),
      ),
    );
  }
}
