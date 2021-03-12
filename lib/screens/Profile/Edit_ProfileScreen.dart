import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../color_style.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  File imageURI;
  bool _isImageUploaded = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.of(context).pushReplacementNamed("/ProfileScreen");
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Edit Profile",
            style: Appconstants.NavBarStyle,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 130,
                                    width: 100,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      child: (_isImageUploaded)
                                          ? (imageURI != null)
                                              ? Image.file(
                                                  imageURI,
                                                  height: 130,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  'images/sam.jpg',
                                                  fit: BoxFit.fitHeight,
                                                )
                                          : Image.asset(
                                              'images/sam.jpg',
                                              fit: BoxFit.fitHeight,
                                            ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 110.0, left: 90),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.deepPurple[50],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: new IconButton(
                                          icon: Icon(
                                            Icons.camera_alt,
                                          ),
                                          iconSize: 24,
                                          color: Colors.black,
                                          splashColor: Colors.purple[100],
                                          onPressed: () {
                                            showImageDialog();
                                          },
                                        ),
                                      ),
                                      // new CircleAvatar(
                                      //   backgroundColor: Colors.deepPurple[50],
                                      //   radius: 20.0,
                                      //   child: new
                                      //   IconButton(
                                      //     icon: Icon(
                                      //       Icons.camera_alt,
                                      //     ),
                                      //     iconSize: 24,
                                      //     color: Colors.black,
                                      //     splashColor: Colors.purple[100],
                                      //     onPressed: () {},
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "First Name :",
                                    style: Appconstants.MProfileTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Enter Name",
                                    contentPadding: EdgeInsets.only(left: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Contact :",
                                    style: Appconstants.MProfileTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Enter Contact",
                                    contentPadding: EdgeInsets.only(left: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email ID :",
                                    style: Appconstants.MProfileTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Enter Email ID",
                                    contentPadding: EdgeInsets.only(left: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "category :",
                                    style: Appconstants.MProfileTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    hintText: "Select Category",
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  items: _dropdownValues
                                      .map(
                                        (value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String value) {},
                                  isExpanded: false,
                                  value: _dropdownValues.first,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sub category :",
                                    style: Appconstants.MProfileTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    hintText: "Select Category",
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  items: _dropdownValues
                                      .map(
                                        (value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String value) {},
                                  isExpanded: false,
                                  value: _dropdownValues.first,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "About :",
                                    style: Appconstants.MProfileTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 10,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Enter About",
                                    contentPadding:
                                        EdgeInsets.only(left: 15, top: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderSide: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                color: Colors.deepPurpleAccent,
                                onPressed: () {},
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImageFromCamera() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 30);
    setState(() {
      if (image != null) {
        imageURI = image;
        _isImageUploaded = true;
      }
    });
    Navigator.pop(context);
  }

  Future getImageFromGallery() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 30);
    setState(() {
      if (image != null) {
        imageURI = image;
        print(imageURI);
        _isImageUploaded = true;
      }
    });
    Navigator.pop(context);
  }

  void showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.white,
              child: Container(
                height: 250,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Choose...",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        getImageFromCamera();
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: new Row(
                          children: <Widget>[
                            Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                "Camera",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        getImageFromGallery();
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: new Row(
                          children: <Widget>[
                            Icon(
                              Icons.image,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                "Gallery",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        color: Colors.transparent,
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
