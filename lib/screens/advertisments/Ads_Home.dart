import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenAds extends StatefulWidget {
  @override
  _HomeScreenAdsState createState() => _HomeScreenAdsState();
}

class _HomeScreenAdsState extends State<HomeScreenAds> {
  List data1 = [
    "images/a1.jpg",
    "images/a2.jpg",
    "images/a3.jpg",
    "images/karon1.png"
  ];
  int _current = 0;
  String WebLink = "www.google.com";
  String ContactNo = "7698815868";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: Colors.white,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                "SponserName",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              ContactNo ?? "",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              color: Colors.deepPurple[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () async {
                                var url = ContactNo ?? "";
                                if (await canLaunch('tel:$url')) {
                                  await launch('tel:$url');
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () async {
                                var url = WebLink;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  WebLink,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              });
        },
        child: CarouselSlider(
          options: CarouselOptions(
              height: 120,
              autoPlay: true,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              aspectRatio: 1,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: List.generate(
            data1.length,
            (index) => Container(
              child: Image.asset(
                data1[index],
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
