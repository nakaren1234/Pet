// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/pages/HomePage.dart';

class Authen extends StatefulWidget {
  Authen({Key key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;
  // Method

  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        size: 48.0,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget content() {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            showAppName(),
            emailText(),
            passwordText(),
            SizedBox(height: 30.0),
            signInButton(),
          ],
        ),
      ),
    );
  }

  Widget showAppName() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        showLogo(),
        SizedBox(width: 10.0),
        showText(),
      ],
    );
  }

  Widget showLogo() {
    return Container(
      width: 48.0,
      height: 48.0,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget showText() {
    return Text(
      'Smart Pet',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.pinkAccent[200],
        fontFamily: 'Lobster',
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: Colors.pinkAccent[200],
          ),
          labelText: 'Email :',
          labelStyle: TextStyle(color: Colors.pinkAccent[200]),
        ),
        onSaved: (String value) {
          emailString = value.trim();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.pinkAccent[200],
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.pinkAccent[200]),
        ),
        onSaved: (String value) {
          passwordString = value.trim();
        },
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.pinkAccent[200],
      child: Text(
        'Login',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        // Navigator.pushNamed(context, 'friststack/home');
        print('You Click Login');
        formKey.currentState.save();
        print('email = $emailString,password = $passwordString');
        checkAuthen();
        //การ routing อีกแบบ
        // MaterialPageRoute materialPageRoute =
        //     MaterialPageRoute(builder: (BuildContext context) => Authen());
        // Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Future<void> checkAuthen() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Authen Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => HomePage());
      Navigator.of(context)
          .pushAndRemoveUntil(materialPageRoute, (route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  Widget showTitle(String title) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.0,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget okButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: showTitle(title),
            content: Text(message),
            actions: [okButton()],
          );
        });
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
          child: Stack(
            children: [
              backButton(),
              content(),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.pinkAccent[200],
      //   child: Icon(
      //     Icons.navigate_next,
      //     size: 36.0,
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}
