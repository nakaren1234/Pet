import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/addListPet.dart';

class AddPetPage extends StatefulWidget {
  AddPetPage({Key key}) : super(key: key);

  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  //Explictie
  Widget addpetWidget = AddListPet();
  //Method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Add Pet History '),
      ),
      //ดึงมาจาก addlistpet
      body: addpetWidget,
    );
  }
}
