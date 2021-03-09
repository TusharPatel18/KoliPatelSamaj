import 'package:flutter/material.dart';
import 'package:kolisamaj/color_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetailsScreen extends StatefulWidget {
  @override
  _MemberDetailsScreenState createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  String contect = "7698815868";
  String _isPermission = "NO";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Member Detail",
          style: Appconstants.NavBarStyle,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 130,
                        width: 100,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(
                            'images/dummyuser.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Satish Patel",
                          style: Appconstants.MProfileTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "CEO At Karon Infotech",
                          style: Appconstants.MProfileTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              if (_isPermission == "YES") {
                                var url = contect ?? "";
                                if (await canLaunch('tel:$url')) {
                                  await launch('tel:$url');
                                } else {
                                  throw 'Could not launch $url';
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Alert"),
                                      content: Text(
                                          "You Don't Have Permission To Contact Him/Her."),
                                      actions: [
                                        FlatButton(
                                          child: Text(
                                            "OK",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                );
                              }
                            }),
                        IconButton(
                            icon: Image.asset(
                              "images/chat.png",
                              height: 20,
                              width: 20,
                            ),
                            onPressed: () async {
                              var url = contect ?? "";
                              if (await canLaunch('sms:$url')) {
                                await launch('sms:$url');
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                        IconButton(
                            icon: Image.asset(
                              "images/whatsapp.png",
                              height: 20,
                              width: 20,
                            ),
                            onPressed: () async {
                              var phone = "+91" + contect;
                              var url = "whatsapp://send?phone=$phone";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'There is no whatsapp installed in your device $url';
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "About :",
                        style: Appconstants.MProfileTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3 - 20,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          "Personal Details  :",
                          style: Appconstants.MProfileTextStyle,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
