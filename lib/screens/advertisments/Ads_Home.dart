import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
