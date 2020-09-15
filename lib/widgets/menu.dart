// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/FristPage.dart';
import 'package:flutterapp/pages/HomePage.dart';
import 'package:flutterapp/pages/NewsPage.dart';

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
                leading: Icon(Icons.home),
                title: Text('หน้าหลัก'),
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
              // ListTile(
              //   leading: Icon(Icons.border_all),
              //   title: Text('สินค้า'),
              //   trailing: Icon(Icons.arrow_right),
              //   selected: ModalRoute.of(context).settings.name ==
              //           'productstack/product'
              //       ? true
              //       : false,
              //   onTap: () {
              //     Navigator.of(context, rootNavigator: true)
              //         .pushNamedAndRemoveUntil(
              //             '/productstack', (Route<dynamic> route) => false);
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.new_releases),
                title: Text('ข่าวสาร'),
                trailing: Icon(Icons.arrow_right),
                // selected:
                //     ModalRoute.of(context).settings.name == 'newsstack/news'
                //         ? true
                //         : false,
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .pushNamedAndRemoveUntil(
                  //         '/newsstack', (Route<dynamic> route) => false);
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => NewsPage());
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
                // selected:
                // ModalRoute.of(context).settings.name == 'homestack/home'
                //     ? true
                //     : false,
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .pushNamedAndRemoveUntil(
                  //         '/', (Route<dynamic> route) => false);
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
