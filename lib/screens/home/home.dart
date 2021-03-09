import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kolisamaj/screens/advertisments/Ads_Home.dart';
import 'Cmponents/HomeScreenCategories.dart';
import 'file:///D:/Clients/koli%20patel%20samaj%20app%20ui%20project/kolisamaj/lib/screens/home/Cmponents/homeCarouselSlider.dart';
import 'package:kolisamaj/screens/navigation/navigation_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _globalKey,
        drawer: NavDrawer(),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Press again to exit app'),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Image.asset(
                          "images/menu.png",
                          color: Colors.white,
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {
                          _globalKey.currentState.openDrawer();
                        }),
                    IconButton(
                        icon: Image.asset(
                          "images/notification.png",
                          color: Colors.white,
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      HomeCarouselSlider(),
                      CategoriesScreen(),
                      HomeScreenAds(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
