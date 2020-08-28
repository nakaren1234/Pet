import 'package:flutter/material.dart';
import 'package:flutterapp/pages/FristPage.dart';
import 'package:flutterapp/pages/HomePage.dart';
import 'package:flutterapp/pages/RegisterPage.dart';

class FristStack extends StatefulWidget {
  FristStack({Key key}) : super(key: key);

  @override
  _FristStackState createState() => _FristStackState();
}

class _FristStackState extends State<FristStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'friststack/frist',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'friststack/frist':
            builder = (BuildContext _) => FristPage();
            break;
          case 'friststack/register':
            builder = (BuildContext _) => RegisterPage();
            break;
          case 'friststack/home':
            builder = (BuildContext _) => HomePage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
