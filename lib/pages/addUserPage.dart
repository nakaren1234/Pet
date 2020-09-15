import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  AddUserPage({Key key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('เพิ่มข้อมูลผู้ใช้'),
      ),
    );
  }
}
