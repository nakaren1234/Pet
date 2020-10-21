import 'package:flutter/material.dart';

class AddListUser extends StatefulWidget {
  AddListUser({Key key}) : super(key: key);

  @override
  _AddListUserState createState() => _AddListUserState();
}

class _AddListUserState extends State<AddListUser> {
  //Field

  //Method

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        showImage(),
        showButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          showContent(),
        ],
      ),
    );
  }
}
