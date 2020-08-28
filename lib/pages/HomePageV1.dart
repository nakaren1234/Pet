import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/logo.dart';
import 'package:flutterapp/widgets/menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fromAbout; //dynamic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        centerTitle: true,
        title: const Logo(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'CodingThailand.com',
            ),
            Text(
              'from about Page is ${fromAbout ?? ''}',
            ),
            RaisedButton(
              child: Text('เกี่ยวกับเรา'),
              onPressed: () async {
                fromAbout = await Navigator.pushNamed(context, 'homestack/about',
                    arguments: {
                      'email': 'codingthailand@gmail.com',
                      'phone': '08888888'
                    });
                setState(() {
                  fromAbout = fromAbout;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
