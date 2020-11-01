import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutterapp/pages/UserPage.dart';
import 'package:image_picker/image_picker.dart';

class AddListUser extends StatefulWidget {
  AddListUser({Key key}) : super(key: key);

  @override
  _AddListUserState createState() => _AddListUserState();
}

class _AddListUserState extends State<AddListUser> {
  //Field
  File file;
  final picker = ImagePicker();
  String name, detail, urlPicture;
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
              print('You Click Upload');

              if (file == null) {
                showAlert('Non Choose Image', 'Please Click Camara or Gallery');
              } else if (name == null ||
                  name.isEmpty ||
                  detail == null ||
                  detail.isEmpty) {
                showAlert('Have Space', 'Please Fill Every Blank');
              } else {
                //upload value to firebase
                uploadPictureToStorage();
              }
            },
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

  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('Userimage/userimage$i.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(file);

    urlPicture =
        await (await storageUploadTask.onComplete).ref.getDownloadURL();
    print('urlpicture = $urlPicture');
    insertValueToFireStore();
  }

  Future<void> insertValueToFireStore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['Name'] = name;
    map['Detail'] = detail;
    map['PathImage'] = urlPicture;

    await firestore.collection('Userprofile').doc().set(map).then((value) {
      print('insert success');
      // MaterialPageRoute route = MaterialPageRoute(
      //   builder: (value) => UserPage(),
      // );
      // Navigator.of(context).pushAndRemoveUntil(route, (value) => false);
    });
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
        onChanged: (String string) {
          name = string.trim();
        },
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
          helperText: 'Type your Name of User',
          // icon: Icon(Icons.face),
        ),
      ),
    );
  }

  Widget detailForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        onChanged: (value) {
          detail = value.trim();
        },
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
          helperText: 'Type your Detail of User',
          labelText: 'Detail',
          // icon: Icon(Icons.assignment_turned_in),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: SvgPicture.asset('assets/icons/camera.svg'),
      iconSize: 36.0,
      // icon: Icon(
      //   Icons.add_a_photo,
      //   size: 36.0,
      //   color: Colors.pink[300],
      // ),
      onPressed: () {
        chooseImage(ImageSource.camera);
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

      //    setState(() {
      //   if (object != null) {
      //     file = File(object.path);
      //   } else {
      //     file = File();
      //     print('No image selected.');
      //   }
      // });

      setState(() {
        // file = object as File;
        file = File(object.path);
      });
    } catch (e) {}
  }

  Widget galleryButton() {
    return IconButton(
      icon: SvgPicture.asset('assets/icons/focus.svg'),
      onPressed: () {
        chooseImage(ImageSource.gallery);
      },
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
          SizedBox(height: 20.0),
          nameForm(),
          SizedBox(height: 10.0),
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
          // uploadButton(),
        ],
      ),
    );
  }
}
