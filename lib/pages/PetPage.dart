import 'package:flutter/material.dart';

class PetPage extends StatefulWidget {
  PetPage({Key key}) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('ประวัติสัตว์เลี้ยง'),
        ),
        body: SingleChildScrollView(
          child: Text('Hello'),
        ));
  }
}
