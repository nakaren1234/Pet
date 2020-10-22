import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/addListUser.dart';

class AddUserPage extends StatefulWidget {
  AddUserPage({Key key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  //Explictie
  Widget adduserWidget = AddListUser();
  //Method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Add User'),
      ),
      //ดึงมาจากadduser
      body: adduserWidget,
    );
  }
}
