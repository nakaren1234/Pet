// import 'dart:ffi';

import 'package:flutter/material.dart';

class ShowListUser extends StatefulWidget {
  ShowListUser({Key key}) : super(key: key);

  @override
  _ShowListUserState createState() => _ShowListUserState();
}

class _ShowListUserState extends State<ShowListUser> {
  // Field

  // Method

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Show User sky'),
    );
  }
}
