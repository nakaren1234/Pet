import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('object');
    return Image.asset(
      'assets/images/cct_logo.png',
      height: 45,
      fit: BoxFit.cover,
    );
    //FlutterLogo(size: 40, colors: Colors.red);
  }
}
