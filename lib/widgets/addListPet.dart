import 'package:flutter/material.dart';

class AddListPet extends StatefulWidget {
  AddListPet({Key key}) : super(key: key);

  @override
  _AddListPetState createState() => _AddListPetState();
}

class _AddListPetState extends State<AddListPet> {
  //Field

  //Method

  Widget nameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
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
          labelText: 'UserName',
          // helperText: 'Type your Name of User',
          // icon: Icon(Icons.face),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: Icon(Icons.add_a_photo),
      iconSize: 36.0,
      color: Colors.green,
      onPressed: () {},
    );
  }

  Widget galleryButton() {
    return IconButton(
      icon: Icon(Icons.add_photo_alternate),
      iconSize: 36.0,
      color: Colors.green,
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
      // color: Colors.green,
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
          SizedBox(height: 30.0),
          nameForm(),
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
        ],
      ),
    );
  }
}
