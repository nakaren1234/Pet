import 'package:flutter/material.dart';

import 'HomePage.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('ติดต่อเรา'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('ติดต่อเรา'),
              RaisedButton(
                child: Text('กลับหน้า Home'),
                onPressed: () {
                  // Navigator.pushNamedAndRemoveUntil(context, 'homestack/home', (Route<dynamic> route) => false);
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => HomePage());
                  Navigator.of(context)
                      .pushAndRemoveUntil(materialPageRoute, (route) => false);
                },
              )
            ]),
      ),
    );
  }
}
