import 'package:flutter/material.dart';
import 'package:flutterapp/pages/addPetPage.dart';
import 'package:flutterapp/widgets/ShowListPet.dart';

class PetPage extends StatefulWidget {
  PetPage({Key key}) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  //Explictie

  Widget petWidget = ShowListPet();

  //method

  Widget addPet() {
    return IconButton(
      icon: Icon(Icons.add_box),
      iconSize: 30.0,
      tooltip: 'Add Pet Profile',
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => AddPetPage());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Pet Profile'),
        actions: [addPet()],
      ),
      body: petWidget,
    );
  }
}
