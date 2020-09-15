import 'package:flutter/material.dart';
import 'package:flutterapp/pages/addUserPage.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  //Explictie

  //Method
  Widget addUser() {
    return IconButton(
      icon: Icon(Icons.person_add),
      iconSize: 30.0,
      // color: Colors.blue,
      tooltip: 'เพิ่มข้อมูลผู้ใช้',
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => AddUserPage());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('User profile'),
          actions: [
            addUser(),
          ],
        ),
        body: SingleChildScrollView(
          child: Text('Hello'),
        ));
  }
}
