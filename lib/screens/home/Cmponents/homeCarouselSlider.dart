import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolisamaj/color_style.dart';

class HomeCarouselSlider extends StatefulWidget {
  @override
  _HomeCarouselSliderState createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  List data = ["Satish Patel", "Two", "Three"];
  List data1 = ["images/sam.jpg", "images/sam.jpg", "images/sam.jpg"];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            // // blurRadius: 1.0,
            // spreadRadius: 1,
            offset: Offset(5.5, 4),
          ),
        ],
      ),
      child: Card(
        elevation: 3.0,
        margin: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 220,
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
                data.length,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        //    decoration: BoxDecoration(
                        //      // border: Border.all(
                        //      //   color: Colors.red[500],
                        //      // ),
                        //      borderRadius: BorderRadius.all(Radius.circular(20)
                        //      ),
                        // ),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.purple[400],
                          child: CircleAvatar(
                            backgroundImage: AssetImage(data1[index]),
                            radius: 43,
                          ),
                        )
                        // CachedNetworkImage(
                        //   imageUrl: "images/no-user.png"
                        //   // images[index]
                        //   ,
                        //   width: MediaQuery.of(context).size.width,
                        //   fit: BoxFit.cover,
                        //   placeholder: (context, source) =>
                        //       Center(child: CircularProgressIndicator()),
                        // ),
                        ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data[index],
                      style: Appconstants.HomeSLiderStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Job Post : " + "CEO",
                      style: Appconstants.HomeTextStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Comapany Name : " + "Karon Infotech",
                      style: Appconstants.HomeTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: data.map((url) {
                  int index = data.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Colors.deepPurple[400]
                          : Colors.grey[400],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
