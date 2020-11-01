import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/CompanyPage.dart';
import 'package:flutterapp/pages/ContactPage.dart';
import 'package:flutterapp/pages/FristPage.dart';
import 'package:flutterapp/pages/PetPage.dart';
import 'package:flutterapp/pages/UserPage.dart';
import 'package:flutterapp/widgets/logo.dart';
import 'package:flutterapp/widgets/menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Explictie
  var fromAbout; //dynamic

  //Method
  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: 'sign Out',
      onPressed: () {
        myAlert();
      },
    );
  }

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are You Sure ?'),
          content: Text('Do You What SignOut ?'),
          actions: [
            cancelButton(),
            okButton(),
          ],
        );
      },
    );
  }

  Widget okButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
        processSignOut();
      },
    );
  }

  Future<void> processSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => FristPage());
      Navigator.of(context)
          .pushAndRemoveUntil(materialPageRoute, (route) => false);
    });
  }

  Widget cancelButton() {
    return FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        centerTitle: true,
        title: const Logo(),
        actions: [signOutButton()],
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
                // Navigator.pushNamed(context, 'homestack/user');
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => UserPage());
                Navigator.of(context).push(materialPageRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(Icons.person, size: 80, color: Colors.pinkAccent),
                    Image.asset(
                      'assets/images/user.png',
                      width: 90.0,
                      height: 90.0,
                    ),
                    Text(
                      'User Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                color: Colors.white70,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'homestack/pet');
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => PetPage());
                Navigator.of(context).push(materialPageRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(Icons.pets, size: 80, color: Colors.pinkAccent),
                    Image.asset(
                      'assets/images/owl.png',
                      width: 70.0,
                      height: 70.0,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Pet Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                color: Colors.white70,
              ),
            ),

            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(Icons.map, size: 80, color: Colors.pinkAccent),
                    Image.asset(
                      'assets/images/route.png',
                      width: 90.0,
                      height: 90.0,
                    ),
                    Text('Map',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                color: Colors.white70,
              ),
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(Icons.camera_alt, size: 80, color: Colors.pinkAccent),
                    Image.asset(
                      'assets/images/camera.png',
                      width: 90.0,
                      height: 90.0,
                    ),
                    Text('Camera',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                color: Colors.white70,
              ),
            ),

            GestureDetector(
              onTap: () async {
                // fromAbout = await Navigator.pushNamed(
                //     context, 'homestack/about',
                //     arguments: {
                //   'email': 'codingthailand@gmail.com',
                //   'phone': '08222888'
                // });
                // setState(() {
                //   fromAbout = fromAbout;
                // });
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => ContactPage());
                Navigator.of(context).push(materialPageRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(Icons.person, size: 80, color: Colors.pinkAccent),
                    Image.asset(
                      'assets/images/aboutuser.png',
                      width: 90.0,
                      height: 90.0,
                    ),
                    Text('เกี่ยวกับเรา ${fromAbout ?? ''}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                color: Colors.white70,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'homestack/company');
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => CompanyPage());
                Navigator.of(context).push(materialPageRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(Icons.library_books,
                    //     size: 80, color: Colors.pinkAccent),
                    Image.asset(
                      'assets/images/read.png',
                      width: 90.0,
                      height: 90.0,
                    ),
                    Text(
                      'User Guide',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                color: Colors.white70,
              ),
            ),
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
                    Icon(Icons.library_books,
                        size: 80, color: Colors.pinkAccent),
                    Text('คู่มือการใช้งาน', style: TextStyle(fontSize: 20))
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
