import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  String userprofileModels;
  Detail(String name, {this.userprofileModels});
  // Detail(String name, {Key key, @required this.userprofileModels}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.userprofileModels),
    );
  }
}
