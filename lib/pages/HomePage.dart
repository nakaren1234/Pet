import 'package:flutter/material.dart';
import 'package:flutterapp/pages/CompanyPage.dart';
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
        backgroundColor: Colors.pinkAccent[100],
        centerTitle: true,
        title: const Logo(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'homestack/company');
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => CompanyPage());
                Navigator.of(context).push(materialPageRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.business, size: 80, color: Colors.purple),
                    Text('มหาวิทยาลัย', style: TextStyle(fontSize: 20))
                  ],
                ),
                color: Colors.white70,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.map, size: 80, color: Colors.purple),
                  Text('แผนที่', style: TextStyle(fontSize: 20))
                ],
              ),
              color: Colors.white70,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.camera_alt, size: 80, color: Colors.purple),
                  Text('กล้อง', style: TextStyle(fontSize: 20))
                ],
              ),
              color: Colors.white70,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'homestack/user');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person, size: 80, color: Colors.purple),
                    Text(
                      'ประวัติผู้ใช้',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                color: Colors.white70,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'homestack/pet');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.pets, size: 80, color: Colors.purple),
                    Text('ประวัติสัตว์เลี้ยง',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20))
                  ],
                ),
                color: Colors.white70,
              ),
            ),
            GestureDetector(
              onTap: () async {
                fromAbout = await Navigator.pushNamed(
                    context, 'homestack/about', arguments: {
                  'email': 'codingthailand@gmail.com',
                  'phone': '08222888'
                });
                setState(() {
                  fromAbout = fromAbout;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person, size: 80, color: Colors.purple),
                    Text('เกี่ยวกับเรา ${fromAbout ?? ''}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20))
                  ],
                ),
                color: Colors.white70,
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, 'homestack/room');
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Icon(Icons.person, size: 80, color: Colors.purple),
            //         Text('ห้องพัก',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(fontSize: 20))
            //       ],
            //     ),
            //     color: Colors.white70,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
