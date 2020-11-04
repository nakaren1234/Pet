// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/pages/FristPage.dart';
import 'package:flutterapp/pages/HomePage.dart';
// import 'package:flutterapp/pages/NewsPage.dart';
import 'package:flutterapp/pages/PetPage.dart';
import 'package:flutterapp/pages/UserPage.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //Explictie
  // String login = '...';
  //Method
  @override
  void initState() {
    super.initState();
  }

  // Future<void> findDisplayName() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   // ignore: deprecated_member_use
  //   FirebaseUser firebaseUser = firebaseAuth.currentUser;
  //   setState(() {
  //     login = firebaseUser.displayName;
  //   });
  //   print('login = $login');
  // }

  Widget showLogin() {
    return Text(
      'Login By ',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Lobster',
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 32,
      height: 32,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Smart Pet',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Lobster',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.80,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showLogo(),
                    showAppName(),
                    SizedBox(
                      height: 10.0,
                    ),
                    showLogin(),
                    // Text(
                    //   'เมนูหลัก',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 24,
                    //   ),
                    // ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text('Home'),
                trailing: Icon(Icons.arrow_right),
                // selected:
                //     ModalRoute.of(context).settings.name == 'homestack/home'
                //         ? true
                //         : false,
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .pushNamedAndRemoveUntil(
                  //         '/homestack', (Route<dynamic> route) => false);
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => HomePage());
                  Navigator.of(context).push(materialPageRoute);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/ownerr.svg',
                  width: 24.0,
                  height: 24.0,
                ),
                title: Text(
                  'User',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => UserPage());
                  Navigator.of(context).push(materialPageRoute);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/dog.svg',
                  width: 24.0,
                  height: 24.0,
                ),
                title: Text('Pet'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => PetPage());
                  Navigator.of(context).push(materialPageRoute);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/camera.svg',
                  width: 24.0,
                  height: 24.0,
                ),
                title: Text('Pet'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => PetPage());
                  Navigator.of(context).push(materialPageRoute);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                trailing: Icon(Icons.arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.directions_run),
                title: Text('ออก'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => FristPage());
                  Navigator.of(context).push(materialPageRoute);
                },
              ),
            ],
          ),
        ));
  }
}
