import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  CompanyPage({Key key}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('User Guide'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildHeader(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'User Guide',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type',
                      textAlign: TextAlign.left,
                    ),
                    Divider(),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Icons.phone_android, color: Colors.purple)
                          ],
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[Text('Nakharen  Meechom')]),
                            Row(children: <Widget>[Text('098-808-1663')])
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                        7,
                        (int index) => Chip(
                          label: Text('Text ${index + 1}'),
                          avatar: Icon(Icons.star),
                          backgroundColor: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    buildFooter()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//image Header
  Image buildHeader() {
    return Image(
      image: AssetImage('assets/images/building.png'),
      fit: BoxFit.cover,
    );
  }

// footer
  Row buildFooter() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
            radius: 40,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
            radius: 40,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
            radius: 40,
          ),
          SizedBox(
              width: 60,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.access_alarm),
                    Icon(Icons.accessibility),
                    Icon(Icons.account_balance),
                  ]))
        ]);
  }
}
