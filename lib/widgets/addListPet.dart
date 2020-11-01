import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddListPet extends StatefulWidget {
  AddListPet({Key key}) : super(key: key);

  @override
  _AddListPetState createState() => _AddListPetState();
}

class _AddListPetState extends State<AddListPet> {
  //Field

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
            onPressed: () {},
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
          // helperText: 'Type your Name of Pet',
          icon: Icon(Icons.face, size: 36),
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
          // helperText: 'Type your Name of Pet',
          icon: Icon(Icons.pets, color: Colors.red),
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
          // helperText: 'Type Male or Female',
          icon: Icon(Icons.accessibility_new),
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
          // helperText: 'Type Male or Female',
          icon: Icon(Icons.color_lens, color: Colors.orange),
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
          // helperText: 'Type Male or Female',
          icon: Icon(Icons.cake, color: Colors.orange),
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
          // helperText: 'Type Male or Female',
          icon: Icon(Icons.assignment, color: Colors.orange),
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
          // helperText: 'Type Male or Female',
          icon: Icon(Icons.line_weight, color: Colors.orange),
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
          // helperText: 'Type Male or Female',
          icon: Icon(Icons.account_circle, color: Colors.orange),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: SvgPicture.asset('assets/icons/camera.svg'),
      iconSize: 36.0,
      color: Colors.green,
      onPressed: () {},
    );
  }

  Widget galleryButton() {
    return IconButton(
      // icon: Icon(Icons.add_photo_alternate),
      icon: SvgPicture.asset('assets/icons/focus.svg'),
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
