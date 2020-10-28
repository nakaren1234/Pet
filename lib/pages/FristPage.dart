// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutterapp/pages/HomePage.dart';
import 'package:flutterapp/pages/RegisterPage.dart';
import 'package:flutterapp/pages/authen.dart';
// import 'package:flutterapp/pages/registerPage.dart';

class FristPage extends StatefulWidget {
  FristPage({Key key}) : super(key: key);

  @override
  _FristPageState createState() => _FristPageState();
}

class _FristPageState extends State<FristPage> {
  //Method

  // @override
  // void initState() {
  //   super.initState();
  //   checkStatus();
  // }

  // Future<void> checkStatus() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //   User firebaseUser = firebaseAuth.currentUser;
  //   if (firebaseUser != null) {
  //     MaterialPageRoute materialPageRoute =
  //         MaterialPageRoute(builder: (BuildContext context) => HomePage());
  //     Navigator.of(context).pushAndRemoveUntil(
  //         materialPageRoute, (Route<dynamic> route) => false);
  //   }
  // }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Smart Pet',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.pinkAccent[200],
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Lobster',
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.pinkAccent[200],
      child: Text(
        'Sign in',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        // Navigator.pushNamed(context, 'friststack/home');
        print('You Click Signin');
        //การ routing อีกแบบ
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Authen());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      child: Text('Sign up'),
      onPressed: () {
        // Navigator.pushNamed(context, 'friststack/register');
        print('You click sign up');
        //การ routing อีกแบบ
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => RegisterPage());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(width: 4.0),
        signUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.pinkAccent[100]],
              radius: 1.0,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                SizedBox(height: 30),
                showAppName(),
                SizedBox(height: 8),
                showButton(),
                // Text('Hert'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
