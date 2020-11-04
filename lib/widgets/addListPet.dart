import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddListPet extends StatefulWidget {
  AddListPet({Key key}) : super(key: key);

  @override
  _AddListPetState createState() => _AddListPetState();
}

class _AddListPetState extends State<AddListPet> {
  //Field
  File file;
  final picker = ImagePicker();
  //Method

  Widget uploadButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          width: MediaQuery.of(context).size.width * 0.3,
          child: RaisedButton.icon(
            color: Colors.pinkAccent,
            onPressed: () {
              print('You Click');
            },
            icon: Icon(
              Icons.save_alt,
              color: Colors.black,
            ),
            label: Text(
              'Save Data',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showAlert(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        });
  }

  Widget nameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          // prefixIcon: Icon(
          //   Icons.face,
          //   color: Colors.green,
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(10.0),
          //   ),
          //   borderSide: BorderSide(color: Colors.grey),
          // ),
          // focusedBorder: OutlineInputBorder(),
          labelText: 'PetName',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type your Name of Pet',
          icon: SvgPicture.asset(
            'assets/icons/dog.svg',
            width: 36.0,
            height: 36.0,
          ),
        ),
      ),
    );
  }

  Widget breedForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Breed',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type your Name of Pet',
          icon: Icon(
            Icons.pets,
            color: Colors.red,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget genderForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Gender',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type Male or Female',
          // icon: Icon(Icons.accessibility_new),
          icon: SvgPicture.asset(
            'assets/icons/genders.svg',
            width: 36.0,
            height: 36.0,
          ),
        ),
      ),
    );
  }

  Widget colorForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Color',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type Male or Female',
          icon: Icon(
            Icons.color_lens,
            color: Colors.orange,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget dobForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'D.O.B',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type Male or Female',
          // icon: Icon(Icons.cake, color: Colors.orange),
          icon: SvgPicture.asset(
            'assets/icons/cake.svg',
            width: 36.0,
            height: 36.0,
          ),
        ),
      ),
    );
  }

  Widget ageForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Age',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type Male or Female',
          // icon: Icon(Icons.assignment, color: Colors.orange),
          icon: SvgPicture.asset(
            'assets/icons/age.svg',
            width: 36.0,
            height: 36.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget weightForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Weight',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type Male or Female',
          // icon: Icon(Icons.line_weight, color: Colors.orange),
          icon: SvgPicture.asset(
            'assets/icons/weight.svg',
            width: 36.0,
            height: 36.0,
          ),
        ),
      ),
    );
  }

  Widget ownerForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Owner',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // helperText: 'Type Male or Female',
          // icon: Icon(Icons.account_circle, color: Colors.orange),
          icon: SvgPicture.asset(
            'assets/icons/ownerr.svg',
            width: 36.0,
            height: 36.0,
          ),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: SvgPicture.asset('assets/icons/camera.svg'),
      iconSize: 36.0,
      color: Colors.green,
      onPressed: () {
        chooseImage(ImageSource.camera);
      },
    );
  }

  Widget galleryButton() {
    return IconButton(
      // icon: Icon(Icons.add_photo_alternate),
      icon: SvgPicture.asset('assets/icons/focus.svg'),
      iconSize: 36.0,
      color: Colors.green,
      onPressed: () {
        chooseImage(ImageSource.gallery);
      },
    );
  }

  Future<void> chooseImage(ImageSource imageSource) async {
    try {
      var object = await picker.getImage(
        source: imageSource,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );

      setState(() {
        // file = object as File;
        file = File(object.path);
      });
    } catch (e) {}
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
      child: file == null
          ? Image.asset('assets/images/pic.png')
          : Image.file(file),
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
          // nameForm(),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: nameForm(),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: breedForm(),
              ),
            ],
          ),
          SizedBox(height: 10.0),

          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: genderForm(),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: colorForm(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: dobForm(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: ageForm(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: weightForm(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: ownerForm(),
              ),
            ],
          ),
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
        ],
      ),
    );
  }
}
