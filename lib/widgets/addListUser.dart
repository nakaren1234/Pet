import 'package:flutter/material.dart';

class AddListUser extends StatefulWidget {
  AddListUser({Key key}) : super(key: key);

  @override
  _AddListUserState createState() => _AddListUserState();
}

class _AddListUserState extends State<AddListUser> {
  //Field

  //Method
  Widget uploadButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          width: MediaQuery.of(context).size.width * 0.5,
          child: RaisedButton.icon(
            color: Colors.pinkAccent,
            onPressed: () {},
            icon: Icon(
              Icons.save_alt,
              color: Colors.black,
            ),
            label: Text(
              'Save Data',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget nameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          helperText: 'Type your Name of User',
          labelText: 'UserName',
          icon: Icon(Icons.face),
        ),
      ),
    );
  }

  Widget detailForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          helperText: 'Type your Detail of User',
          labelText: 'Detail',
          icon: Icon(Icons.assignment_turned_in),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        size: 36.0,
        color: Colors.pink[300],
      ),
      onPressed: () {},
    );
  }

  Widget galleryButton() {
    return IconButton(
      icon: Icon(
        Icons.add_photo_alternate,
        size: 36.0,
        color: Colors.pink[300],
      ),
      onPressed: () {},
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        cameraButton(),
        galleryButton(),
      ],
    );
  }

  Widget showImage() {
    return Container(
      padding: EdgeInsets.all(20.0),
      // color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset('assets/images/pic.png'),
    );
  }

  Widget showContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          showImage(),
          showButton(),
          nameForm(),
          detailForm(),
          SizedBox(height: 30.0),
          uploadButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          showContent(),
          uploadButton(),
        ],
      ),
    );
  }
}
