import 'package:cloud_firestore/cloud_firestore.dart';
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
  //Field

  String name, detail;

  //Method
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
        Expanded(
          child: Text(
            widget.userprofileModels.detail,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          showImage(),
          showText(),
        ],
      ),
    );
  }

  Widget nameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        // onChanged: (String string) {
        //   name = string.trim();
        // },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.face,
            color: Colors.green,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(),
          labelText: widget.userprofileModels.name,
          // helperText: 'Type your Name of User',
          // icon: Icon(Icons.face),
        ),
      ),
    );
  }

  Widget detailForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.height * 0.2,
      child: TextField(
        // onChanged: (value) {
        //   detail = value.trim();
        // },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.assignment_turned_in,
            color: Colors.green,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(),
          labelText: widget.userprofileModels.detail,
          // helperText: 'Type your Detail of User',
          // icon: Icon(Icons.assignment_turned_in),
        ),
      ),
    );
  }

  Future<void> updateFireStore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['Name'] = name;
    map['Detail'] = detail;

    await firestore.collection('Userprofile').doc().set(map).then(
      (value) {
        print('insert success');
      },
    );
  }

  Future<void> deleteFireStore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['Name'] = name;
    map['Detail'] = detail;

    await firestore.collection('Userprofile').doc().delete().then(
      (value) {
        print('delete success');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.userprofileModels.name),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30.0,
            ),
            padding: EdgeInsets.only(right: 15.0),
            onPressed: () {
              BottomSheet(context);
            },
          )
        ],
      ),
      body: showListView(),
    );
  }

  // ignore: non_constant_identifier_names
  void BottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Update Data',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.orange,
                          size: 25.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                      ),
                    ),
                    // showName(),
                    nameForm(),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                      ),
                    ),
                    detailForm(),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text('Submit'),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        updateFireStore();
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 20.0),
                    RaisedButton(
                      child: Text('delete'),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        deleteFireStore();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
