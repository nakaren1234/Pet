import 'package:flutter/material.dart';
import 'package:flutterapp/models/userprofile_model.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  UserprofileModel userprofileModels;
  Detail({this.userprofileModels});
  // Detail(String name, {Key key, @required this.userprofileModels}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Widget showImage() {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            image: NetworkImage(widget.userprofileModels.pathImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget showName() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.userprofileModels.name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget showDetail() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.userprofileModels.detail,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget showText() {
    return Container(
      padding: EdgeInsets.all(20.0),
      // width: MediaQuery.of(context).size.width * 0.4,
      // height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          showName(),
          SizedBox(height: 10.0),
          showDetail(),
          // showName(),
        ],
      ),
    );
  }

  Widget showListView() {
    return Column(
      children: [
        showImage(),
        showText(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.userprofileModels.name),
      ),
      body: showListView(),
    );
  }
}