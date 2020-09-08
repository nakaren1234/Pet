import 'package:flutter/material.dart';
import 'package:flutterapp/pages/FristPage.dart';
// import 'package:flutterapp/pages/FristStack.dart';
// import 'package:flutterapp/pages/HomeStack.dart';
// import 'package:flutterapp/pages/NewsStack.dart';
// import 'package:flutterapp/pages/ProductStack.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.green,
          primaryColor: Color(0xFFea80fc),
          //accentColor: Colors.greenAccent,
          accentColor: Color(0xFFffb2ff),
          canvasColor: Colors.blue[50],
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: Colors.green,
                  fontSize: 50,
                  fontWeight: FontWeight.w600),
              headline6: TextStyle(color: Colors.red))),
      home: FristPage(),
      // initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   // '/': (context) => HomeStack(),
      //   '/': (context) => FristStack(),
      //   '/homestack': (context) => HomeStack(),
      //   '/productstack': (context) => ProductStack(),
      //   '/newsstack': (context) => NewsStack(),
      // };
      debugShowCheckedModeBanner: false,
    );
  }
}
