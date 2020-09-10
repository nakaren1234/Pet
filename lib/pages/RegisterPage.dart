import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/pages/HomePage.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Explictie
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  // Method

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Uplode');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString, email = $emailString, password = $passwordString');
          registerThread();
        }
      },
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success for Email = $emailString');

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => HomePage());
      Navigator.of(context)
          .pushAndRemoveUntil(materialPageRoute, (route) => false);
      // setupDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title, message = $message');
      myAlert(title, message);
    });
  }

  // Future<void> setupDisplayName() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   await firebaseAuth.currentUser().then((response){
  //      UserUpdateInfo userUpdateInfo = UserUpateInfo();
  //     userUpdateInfo.displayname = nameString;
  //     response.updateProfile(userUpdateInfo);

  //   });
  // }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.red,
                size: 48.0,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: Text(message),
            actions: [
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          color: Colors.purple,
          size: 48,
        ),
        labelText: 'Display Name : ',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type You Nick Name for Display',
        helperStyle: TextStyle(
          color: Colors.purple,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Name in the Blank';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.green[800]),
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          color: Colors.green[800],
          size: 48,
        ),
        labelText: 'Email : ',
        labelStyle: TextStyle(
          color: Colors.green[800],
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type You Email',
        helperStyle: TextStyle(
          color: Colors.green[800],
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Type Email in Exp. you@email.com';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        emailString = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: Colors.blue[800]),
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          color: Colors.blue[800],
          size: 48,
        ),
        labelText: 'Password : ',
        labelStyle: TextStyle(
          color: Colors.blue[800],
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type You Password more 6 charactor',
        helperStyle: TextStyle(
          color: Colors.blue[800],
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (value) {
        if (value.length < 6) {
          return 'Password More 6 Charactor';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        passwordString = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: Text('Register'),
        actions: [registerButton()],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: [
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
