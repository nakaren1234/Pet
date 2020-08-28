import 'package:flutter/material.dart';
import 'package:flutterapp/pages/AboutPage.dart';
import 'package:flutterapp/pages/CompanyPage.dart';
import 'package:flutterapp/pages/ContactPage.dart';
import 'package:flutterapp/pages/HomePage.dart';
import 'package:flutterapp/pages/PetPage.dart';
import 'package:flutterapp/pages/RoomPageV1.dart';
import 'package:flutterapp/pages/UserPage.dart';

class HomeStack extends StatefulWidget {
  HomeStack({Key key}) : super(key: key);

  @override
  _HomeStackState createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            builder = (BuildContext _) => HomePage();
            break;
          case 'homestack/about':
            builder = (BuildContext _) => AboutPage();
            break;
          case 'homestack/contact':
            builder = (BuildContext _) => ContactPage();
            break;
          case 'homestack/company':
            builder = (BuildContext _) => CompanyPage();
            break;
          case 'homestack/room':
            builder = (BuildContext _) => RoomPage();
            break;
          case 'homestack/user':
            builder = (BuildContext _) => UserPage();
            break;
          case 'homestack/pet':
            builder = (BuildContext _) => PetPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
